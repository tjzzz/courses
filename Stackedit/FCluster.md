#概述
##1.数据
一般的聚类的数据形式是$X=(X_{ij})_{n*p}$的矩阵形式，行是不同的样本观测，列是不同的指标变量。
对于location的轨迹数据来说，一个人的行为轨迹构成的一个观测，指标可以看做坐标(x,y)，同时还是时间t的函数，即$X=(X_{ij}(t))_{n*p}$
## 2研究意义
　　随着移动互联网的快速发展， 手机中很多的app(地图类，团购类，浏览器等)都会直接或者间接的调用人们的地理位置数据或者说是经纬度数据.

- 传统的基于用户的行为指标的聚类分析，更多的还是基于其线上的行为。如今需要基于其地理位置，更甚者是基于其行为轨迹
- 数据的不规则性，不是传统的矩阵形式，用户的轨迹可以是很不规则的？？
- 未来移动互联网的发展战场会有很大一部分移动到O2O场景中，而其中地图是很重要的一部分
- 结合，将用户之间的社交网络+线上行为+行为轨迹===>真正细分，个性化推荐

----------------

#2.阅读的paper
##1.Functional data clustering: a survey
好像不太一样
cluster functional data 是指对$X={X(t),t\in \Gamma}$的数据而言，而实际中时间因素有时候并不是很强，重点在轨迹上,而且数据也不是那么整齐

**FDA简介**
多元functional data [Model-based clustering for multivariate functional data](http://www.sciencedirect.com/science/article/pii/S0167947312004380#)
处理FD的难点在于

- 维度是无穷的，实际只是有限时间点上的数据。一般首先会对离散观测处理
	- 1.sample path 
	$X_i(t)$是由有限维度的基扩展出来的，假设一组基函数$\Phi=\{\phi_1,\dots,\phi_L\}$
	$$X_i(t)=\sum_{l=1}^L\alpha_{il}\phi_l(t)$$
	比如，在选定一组基之后，可以用LS的方法估计出每个sample的系数
	- 2.非参平滑

**主要的聚类方法**

- raw data clustering /two stage method
    $X_{ij}$离散观测，直接简单的对数据矩阵进行聚类，可能会需要一些高维聚类方法
- 非参数聚类
- model based clustering

###1.二阶段clustering
降维：即用一些基函数去近似原来的curve，比如spline basis，FPCA
聚类：可以对系数，或者PCA score

###2.非参方法
非参的方法也也分为两类：

- 定义一些特定的距离，然后用传统的聚类方法进行聚类，比如
$$d_l(x_i,x_j)=(\int_{\Gamma}(x_i^{(l)}(t)-x_j^{(l)}(t))^2dt)^{1/2}$$
其中$x^{(l)}$表示$l$阶导数
- 一些新的算法
参考[26],[57]

###3.model based methods

| Model on |Type of model | Reference|
|-----|-----|------|
|FPCA scores| Gaussian (parsimonious sub-models) |[10]|
|| Gaussian | [28, 29]|
||Gaussian spherical (k-means) | [14]|
|basis expansion coefficients|Gaussian (parsimonious) |[30]|
||Gaussian with regime changes |[45]|
||Bayesian |[22, 25, 43]|

####**3.1 Model-based functional clustering techniques using principal components modelling**

####**3.2using basis expansion coefficients modelling**
作者认为在以上的三大类方法中，第三类的最好

###4. 关于模型选择
- 聚类数K的选择
- 基函数的选择

###5. R code
本文中有一些R的code的例子和对应的package，需要时可以再查

--------------------
##2.多元Model-based clustering for multivariate functional data
###1.introduction
潜在的数据生成机制如下
$$X=\{X(t)\}_{t\in[0,T]} with X(t)=(X^1(t),\dots,X^p(t))'\in R^p,p\ge 2$$
简单的经纬度的数据，就相当于是$p=2$的情景
 Saporta (1981) provides a complete analysis of multivariate functional data from the point of view of factorial methods (principal components and canonical analysis)[书。。]
###  2.MFPCA

----

##3.移动对象轨迹的数据挖掘研究_宁波大学
对移动数据的研究主要集中在:

* 移动数据聚类分析
	* 基于距离和相似性的
	* 基于特征的
	
P. Kalnis[3]则是从另外一种角度来研究类似
的问题，他将移动对象看成是不同时间片的空间位置的集合，那么基于密度的空
间聚类就变成了能持续几个连续时间片的移动对象


* 移动数据异常点检测、
* 频繁模式挖掘
* 位置和轨迹预测等四个方向

###3.1聚类分析
按照聚类对象的不同更可以分为：基于移动对象的聚类和基于轨迹的聚类
hausdorff距离





----------------------

##possible datasets

1. Canadian weather dataset (temperature and
precipitation curves for Canadian weather stations [10, 28, 42]

2.Recently, some authors are interested in the case of multivariate functional data[42]
Few works have defined clustering algorithms for such multiv ariate functional data: [27, 29, 57].

#目前面临的问题
1.若是基于距离的度量，怎样刻画距离？坐标问题？？
2.时间问题？？开始结束时间都不同，若是只研究轨迹聚类问题，可以先限制在一段时间内。这样的问题似乎就与时间没时间关系了
3.数据的获取问题


-----------------------
1.关联规则cell的相似性度量 ?? A-B-C-D   B-C-D
这个想法不行，数据本质上还是连续的，只是因为收集的问题变成了cell，不具有统一性。
2.先搞定PCA，再聚类？？
