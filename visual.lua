
require 'nn'
require 'cunn'
require 'cudnn'
require 'image'
local t = require 'transforms'
local imagenetLabel = require './imagenet'

if #arg < 2 then
   io.stderr:write('Usage: th visual.lua [MODEL] [FILE]...\n')
   os.exit(1)
end
for _, f in ipairs(arg) do
   if not paths.filep(f) then
      io.stderr:write('file not found: ' .. f .. '\n')
      os.exit(1)
   end
end


-- Load the model
local model = torch.load(arg[1])
local net = model:clone()
local softMaxLayer = cudnn.SoftMax():cuda()

-- add Softmax layer
model:add(softMaxLayer)

-- Evaluate mode
model:evaluate()

-- For visualization
weight_lr = net:get(#net.modules).weight:clone()
bias_lr = net:get(#net.modules).bias:clone()
net:remove(#net.modules)
net:remove(#net.modules)
net:remove(#net.modules)
net:add(cudnn.SpatialConvolution(2048,1000,1,1,1,1,0,0))
net:get(#net.modules).weight = torch.reshape(weight_lr, net:get(#net.modules).weight:size())
net:get(#net.modules).bias   = torch.reshape(bias_lr, net:get(#net.modules).bias:size())
net:cuda()
net:evaluate()

-- The model was trained with this input normalization
local meanstd = {
   mean = { 0.485, 0.456, 0.406 },
   std = { 0.229, 0.224, 0.225 },
}

local transform = t.Compose{
   t.Scale(256),
   t.ColorNormalize(meanstd),
   t.CenterCrop(224),
}

local N = 3

for i=2,#arg do
  -- load the image as a RGB float tensor with values 0..1
  local img = image.load(arg[i], 3, 'float')
  local im = img:clone()
  local name = paths.basename(arg[i], 'JPEG')

  -- Scale, normalize, and crop the image
  img = transform(img)

   -- View as mini-batch of size 1
  local batch = img:view(1, table.unpack(img:size():totable()))

   -- Get the output of the softmax
  local output = model:forward(batch:cuda()):squeeze()

   -- Get the featuremap
  local featuremap = net:forward(batch:cuda()):squeeze()

   -- Get the top N class indexes and probabilities
  local probs, indexes = output:topk(N, true, true)
  print('Classes for', arg[i])

  for n=1,1 do
    print(probs[n], imagenetLabel[indexes[n]])
    map = image.scale(featuremap[indexes[n]]:float(), img:size(2),img:size(3))
    im = image.scale(im, img:size(2),img:size(3))
    map = (torch.div((map - torch.min(map)), (torch.max(map)-torch.min(map))):mul(255)+1):round()
    map = image.y2jet(map)
    map = img:mul(0.2)+map:mul(0.8)
    frame = torch.cat(im, map, 3)
    frame=image.drawText(frame, imagenetLabel[indexes[n]], 10, 10)
    image.save(string.format('images/%s.png', name), frame)
  end
end

