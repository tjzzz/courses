

#可能的想法
对于经纬度的数据:

##1. 根据时间做轨迹的PCA
　　一个是对**轨迹**的PCA，对轨迹做PCA，即挖掘出热门轨迹，常用轨迹？？，那么样本观测应该就是每一个id(即每一个轨迹)，观测是一条轨迹。
　　 或者若样本的时间比较长，比如出租车数据，可以以1天为一个时间单位，每天的会有轨迹的PCA，然后随着时间的变化形成functional—functional
　　 假如用出租车数据，挖掘出主要的轨迹路线，人们路线，交通拥挤情况（可以与关联分析比较）
　　 另外应用方面还可以用在聚类上

　　 
**可能的方法**
1.仿照黄老师surface的方法，构造curve
2. 假设曲线是$T_i$是$(x(t),y(t))$,对应的轨迹的PCA应该形如:
$$[X_i(t),Y_i(t)]=[X_0(t),Y_0(t)]+\sum\alpha_j[FX_j(t),FY_j(t)]$$
即每条轨迹曲线可以用几个主要的轨迹曲线表示出来(这里先不考虑时间的长短不同)

则有$$[X^T_i(t),Y^T_i(t)]^T=[X^T_0(t),Y^T_0(t)]^T+\sum\alpha_j[FX^T_j(t),FY^T_j(t)]^T$$
即可以将轨迹的PCA问题，变为一般的

3.按照functional data analysis书中介绍的multi-FPCA的框架

首先把轨迹用数学的曲线表示出来，即x坐标的$x_1(t),x_2(t),\dots, x_n(t)$以及y坐标上的$y_1(t),\dots,y_n(t)t$
可以类似定义covariance
$$v_{xx},v_{yy},v_{x,y}(s,t),v_{yx}(s,t)$$
对于二元曲线，定义其对应的weight function为$\xi=(\xi^x,\xi^y)$,定义这种情况下的内积形式$$<\xi_1,\xi_2>=\int\xi_1^x\xi_1^y+\int\xi_2^x\xi_2^y$$
记录$A_i=(x_i,y_i)$,则主成分得分
$$f_i=<A_i,\xi>=\int x_i\xi^x+\int y_i\xi^y$$
对于$V\xi=\rho\xi$可以写为
$$\int v_{xx}\xi^x+\int v_{xy}\xi^y=\rho\xi^x$$
$$\int v_{yx}\xi^x+\int v_{yy}\xi^y=\rho\xi^y$$
实际计算的时候可以用离散版本，数据变为一个长向量，转为一般的PCA。
另外如果x,y的变异程度不同，可能需要进行权重调整








###2.时空轨迹的聚类
时间窗口的的聚类,距离度量+时间的惩罚
	  $$距离的度量+\lambda L(t)$$
需要解决的步骤:

* 数据的来源
* 一般经纬度的聚类问题
在cluster_location中的很多文献有对曲线相似性的衡量方法
* 当$\lambda=0,即相当于是一般的经纬度轨迹的聚类$,$\lambda$较大时即需要考虑时间了，可以结合fCluster，mfCluster

**问题**
曲线拉直伸缩变换问题
时间长度的不统一——Fcluster
扩展：有方向的轨迹PCA

---------------
查找资料

1.[Uncertain Data Mining: An Example in Clustering Location Data](http://link.springer.com/chapter/10.1007/11731139_24)
我去，百度文库上有

2.[Future Locations Prediction with Uncertain Data](http://link.springer.com/chapter/10.1007/978-3-642-40988-2_27)  done

The ability to predict future movements for moving objects enables better decisions in terms of time, cost, and impact on the environment. Unfortunately, future location prediction is a challenging task. Existing works exploit techniques to predict a trip destination, but they are effective only when location data are precise (e.g., GPS data) and movements are observed over long periods of time (e.g., weeks).
We introduce a data mining approach based on a Hidden Markov Model (HMM) that overcomes these limits and improves existing results in terms of precision of the prediction, for both the route (i.e., trajectory) and the final destination. The model is resistant to uncertain location data, as it works with data collected **by using cell-towers to localize the users instead of GPS devices, and reaches good prediction results in shorter times (days instead of weeks in a representative real-world application). Finally, we introduce an** enhanced version of the model that is orders of magnitude faster than the standard HMM implementation.

----------------------------
##DATA 
1.数学建模出租车数据
2.MIT实验
Inferring Social Network Structure using Mobile Phone Data
http://realitycommons.media.mit.edu/realitymining3.html
3.作图的
http://thegrantlab.org/bio3d/tutorials/principal-component-analysis

4.气温
5. 飓风轨迹

----

1.excel绘图展示：
深圳出租车一般早上6.7~10点左右
下午~晚上2点左右

2.bio3D
http://thegrantlab.org/bio3d/index.php

---
2014-10-24 10:42:33 讨论班
1.  Classif ication with conf idence
数字识别的例子，用在轨迹相当于之前设想的Z=f(x,y)=1或者0的情形。
对0-1“矩阵”做二维FPCA
2. 查下handwriting PCA，当做图像处理

两种思路：1.对每一个car为一个sample，所有car的，可以加时间的
2.以一天为一个sample观测，这样的直观意义很明显，样本数7太少，而且和二维的有点像{0，1},可以对比效果


扩展：
有向轨迹的分析，挖掘出单向路径

-----
##process
###1. FDA2的内积定义形式，推出离散版本
轨迹的内积定义是合理的，比一般的一维的多出一些，因为是从两个维度考虑的。
>1. covariance operator

###2. 离散版本的实验
###3. 连续理论
1. 尝试解方程组
结合一维、二维的形式。单从表达式来看，由一维组成



2. 看zhou的方法
[Mercer's_theorem](http://en.wikipedia.org/wiki/Mercer's_theorem)


2. Fredholm integral equation的第二种的解法
http://en.wikipedia.org/wiki/Fredholm_integral_equation
好像有一些数值解法，Bspline近似，试下可否解方程组

3.mixed effects model

* 仿照zhou方法
* 正交旋转？？
$$x_i(t)=\mu_x(t)+\sum_{j=1}^J\alpha_{ij}Fx_j(t)+\epsilon_i(t)$$
$$y_i(t)=\mu_y(t)+\sum_{j=1}^J\alpha_{ij}Fy_j(t)+\epsilon_i(t)$$
尝试分别求，然后做适当的旋转，让$\alpha_{ij}$一致？？



###4.  实验连续版本

### 5.资源
zhou的主页 https://www.stat.tamu.edu/~lzhou/paper.html


