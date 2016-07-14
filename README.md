# visualResNet_torch

Curious about where is the ResNet looking at? This repo visualizes the class specific saliency map or discriminative location. 
It is Torch re-implementation of [Learning Deep Features for Discriminative Localization, Bolei Zhou et. al.](http://arxiv.org/abs/1512.04150), 
without modifying the network or re-training. (MatConvNet re-implementation can be found at this [repo](https://github.com/zhanghang1989/visualResNet).) We look directly through the ResNet to see the world.


### Get Started

- The code relies on [Torch](https://github.com/torch/torch7), which should be downloaded and built before running the experiments. 

- Download the code:
```sh
git clone https://github.com/zhanghang1989/visualResNet_torch.git
```

- Run the progrem:
```sh
th visual.lua resnet-50.t7 data/1.JPEG data/2.JPEG 
```

### Examples

<div style="text-align:center">
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/1.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/2.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/3.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/4.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/5.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/6.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/7.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/8.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/9.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/10.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/11.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/12.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/13.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/14.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/15.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/16.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/17.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/18.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/19.JPEG" width="420" />
<img src ="https://github.com/zhanghang1989/visualResNet/raw/master/images/20.JPEG" width="420" />
</div>

