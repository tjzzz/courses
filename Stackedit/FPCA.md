#说明
FPCA的papers笔记

#Principal Component Analysis of Two-dimensional Functional Data
##1. introduction
常见的FPCA的做法是

- local polynomial kernel
- splines
- roughness penalties

从1-d扩展到2-d可能面临的问题：区域的形状，维度

## 2 Principal Component Analysis of 2-D Functional Data
一些基本符号
假设$Z(x,y)$表示一个随机曲面surface,记$\mu(x,y)=E(Z(x,y))$。
**covariance function**
$$K(x_1,y_1;x_2,y_2)=E[(Z(x_1,y_1)-\mu(x_1,y_1))(Z(x_2,y_2)-\mu(x_2,y_2))]$$
并假设其在$\Omega *\Omega $上是连续的，平法可积，$\Omega $是$R^2$的一个子集

**standardized weighting function**
if $||\phi||^2=\int_{\Omega}\phi^2(x,y)dxdy=1$,即相当于投影时的系数，投影
$$\alpha=\int_{\Omega}\phi(x,y)Z(x,y)dxdy$$

目标是使线性变换后的方差达到最大
$var(\alpha)=\int_{\Omega}\phi(x_1,y_1)K(x_1,y_1;x_2,y_2)\phi(x_2,y_2)dx_1dy_1dx_2dy_2$
所以
$$\phi_1=argmax_{||\phi||=1}\int_{\Omega}\phi(x_1,y_1)K(x_1,y_1;x_2,y_2)\phi(x_2,y_2)dx_1dy_1dx_2dy_2$$
以此类推求其他的。

###  stochastic processes (Bosq, 2000)
根据随机过程的一些理论有如下的性质存在

* 存在正交函数序列$(\phi_j)$,以及一个非增的序列$k_j$,使得
$$\int_{\Omega}K(x_1,y_1;x_2,y_2)\phi_j(x_2,y_2)dx_2dy_2=k_j\phi(x_1,y_1)$$
$$K(x_1,y_1;x_2,y_2)=\sum_{j=1}^{\inf}k_j\phi(x_1,y_1)\phi_j(x_2,y_2)$$
并且有$$\sum k_j=\int_{\Omega}E(Z(x,y)-\mu(x,y))^2dxdy$$
$k_j$和$\phi_j$就叫做**特征值**和**特征函数**了

这些特征函数就是主成分了，而投影$\alpha_j=\int Z(x,y)\phi_j(x,j)dxdy,j=1,2,...$就是主成分得分了

### empirical version
实际数据t=1,2，。。。n，经验版本
计算上 离散版本Z(x,y)
$$\frac{1}{n}||Z-1\mu^T-A\Phi^T||^2=\frac{1}{n}\sum_{i=1}^n\sum_{k=1}^K(z_{ik}-\mu_k-\sum_{j=1}^J\phi_{kj}a_{ij})^2$$
这个即相当于对$Z-1\mu^T$做SVD分解，
这种离散化的方法比较适用于数据抽样密度比较大的时候。比较稀疏的时候可以采用2-step的方法。即先平滑，再处理，但效果不好。

##3. Mixed Effects Models for Principal Component Analysis
model based method，这里简记为mFPCA
###3.1 mixed effects model
$$Z_i(x,y)=\mu(x,y)+\sum_{j=1}^J\alpha_{ij}\phi_j(x,y)+\epsilon_i(x,y)$$
其中$\alpha_{ij},\epsilon_i(x,y)$是随机变量，期望是0，$var(\alpha_{ij})=\sigma^2_{j}$,$var(\epsilon_i(x,y))=\sigma^2$

假设$\textbf{b}(x,y)$是一个正交基函数向量，满足$$\int_{\Omega}b(x,y)b^T(x,y)dxdy=I$$
假设

----
#**MULTI-PCA**
-----

#**2DPCA**
张量是一种高维数据的组织方法。类似于一维的标量，二维的向量，三维及以上的数据统称为张量。
传统的方法（例如PCA、SVD和LDA）对于维数比较高的数据，一般通过“硬”方法，直接降维成二维的数据形式（矩阵）进行处理。近些年，出现的2DPCA，2DSVD等新方法，是通过双向的对二维数据进行处理，在处理的过程中，不会使用“硬”的降维方法而破坏数据的结构信息。近些年来，张量数据处理的数学条件已经非常成熟，在SIAM等期刊上已经有大量的张量数据分解和处理方法出现，而这也是近些年来的一个热门方向。
张量分解的方法主要有HOSVD、HOOI以及上面提到的2DPCA和2DSVD等。上面的两种方法只限于处理三维的张量数据，具有局限性；其实也可以将它们两个看作是HOOI的一种特殊情况。相关的数学的具体文献可以再网上找到。

-----------------

#**Functional data analysis 2nd**

看PCA的最原始的来源

1.定义轨迹所属于的数据类型？？
（1）不像纯粹的2维PCA ,z=f(x,y)，数据是在一个二维平面上变化的
也不像纯粹的y=f(x)形式，
(2) 关于曲线积分？？

##内积的定义
1. 若是采用bivariate的定义方式，则在$(x,y(x))$可以显示的表示出来的时候，和直接的$\int f_1(x)f_2(x)dx$的定义会出现差别？？

$$\int t*tdt+\int f_1(t)f_2(t)dt$$



---

**8.6 further readings and notes** 值得去读
##Chapter1 introduction
###1.5 The first steps in FDA
1. 数据预处理
若离散的观测是无误差的——interpolation 插值
若离散的观测是有误差的——smoothing平滑方法
2. data registration
3. plot pairs of derivatives
有时候function和其导数之间可以求出表达关系，分别将其绘制在x-y轴进行展示

官方网址[www.functionaldata.org](www.functionaldata.org)






----
