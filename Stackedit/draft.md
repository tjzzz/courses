这部分主要是模型推导部分吧

## 1.PCA with trajectory data
###1. 传统的多元数据的PCA
对于一组随机变量$X_1, \cdots,X_p$，PCA是找到原始变量的一个线性组合，
$$f_i=\sum_{j=1}^p\beta_jx_[ij],i=1,\cdots,n$$
其中$\beta_j$是加权系数，写成向量的形式是
$$f_i=\beta'x_i,i=1,\cdots,n$$
目标是使得新生成的主成分方差达到最大，并且各个主成分之间是不相关的。
即将原始变来那个经过权重系数进行投影，这一操作其实就是一个内积运算如下：
$$f_i=<\beta,x_i>$$

###2.FPCA
在函数型数据中，此时的每一个样本是一条曲线$x_i(s)$,即多元数据中的角标$j$被一个连续性的指示变量$s$替代了，多元情况下，内积定义是
$\beta' x\sum_j\beta_jx_j$

当$\beta$和$x$变为函数$\beta(s),x(s)$时，对应的定义的内积如下：
$$<\beta,x>=\int \beta(s)x(s)ds$$


其他的介绍。。。。。covariance operator
#### 2.2 二维FPCA

### 3. 轨迹的PCA
　　与一维和二维的情形不同的是估计数据类型，因为轨迹可能是杂乱无章的。因此很难像一维函数$y=f(t)$一样写出显示表达。其包含两个坐标方向，因此是个向量$x(t),y(t)$,但是与二维函数不同，二维PCA是基于$Z=f(x,y)$.

　　对于平面中的一条轨迹，记为$s=(x(t),y(t))$，其中x表示其经度，y表示其维度，t表示曲线内在的参数，这里假设每条曲线都转换到$t\in [0,1]$的区间上。
　　根据PCA的基本思想，首先需要定义内积，即一条轨迹到另一条轨迹的投影，需要考虑到以下两个问题：

* 需要同时考虑x和y方向
* 轨迹是无向的，即两条不同的$x$和$y$，其轨迹可能是一样的
【插入图】

【定义】记$s_i=(x_i(t),y_i(t))$表示第$i$个人的轨迹，**并且经过无向化处理**。主成分轨迹是$\xi=(\xi_x,\xi_y)$，定义如下形式的内积(Silverman)
$$<s_i,\xi>=\int x_i(t)\xi_x(t)dt+\int y_i(t)\xi_y(t)dt  $$

定义$v_{xx}$是$x$方向上的协方差算子，$v_{yy}$是$y$方向上的协方差算子,$v_{xy}$是$x$和$y$之间的协方差算子函数，且有$v_{xy}=v_{yx}$。

根据主成分分析的基本思想有
$$V\xi=\rho\xi$$
根据前面介绍的FPCA 的covairance operator的定义有：
\begin{eqnarray*}
   V \xi &=&E(<s-Es,\xi>(s-Es))  \\
   &=&E\big((\int (x-Ex)\xi_x+\int(y-Ey)\xi_y)(x-Ex,y-Ey) \big) \\
   &=& \left(
  \begin{array}{}
 \int v_{xx}\xi_1+\int v_{xy}\xi_2\\
  \int v_{yx}\xi_1+\int v_{yy}\xi_2\\
  \end{array}
\right)^T
\end{eqnarray*}
所以最终变为解如下的 方程组：
$$\int v_{xx}(s,t)\xi_x(t)dt+\int v_{xy}(s,t)\xi_y(t)dt=\rho\xi_1(s)$$
 $$ \int v_{yx}(s,t)\xi_x(t)dt+\int v_{yy}(s,t)\xi_y(t)dt=\rho\xi_2(s)$$
 并且要满足
 $<\xi_i,\xi_j>=\int \xi_{ix}\xi_{jx}+\int \xi_{iy}\xi_{jy}=\delta_{ij}$


M1: Fredholm integral方程组 
Fredholm integral equation的第二种的解法
http://en.wikipedia.org/wiki/Fredholm_integral_equation
好像有一些数值解法，Bspline近似，试下可否解方程组
看zhou的方法
M2: [Mercer's_theorem](http://en.wikipedia.org/wiki/Mercer's_theorem)

实际中，当样本的离散观测间隔比较短时，为方便计算，可以用离散版本来替代上面的积分形式。离散版本的推导如下：
$$\sum_t v_{xx}(s,t)\xi_x(t)+\sum_t v_{xy}(s,t)\xi_y(t)=\rho\xi_1(s)$$
 $$ \sum_t v_{yx}(s,t)\xi_x(t)+\sum_t v_{yy}(s,t)\xi_y(t)=\rho\xi_2(s)$$
即
$$v_{xx}\xi_x+v_{xy}\xi_y=\rho\xi_1$$
 $$v_{yx}\xi_x+v_{yy}\xi_y=\rho\xi_2$$
 所以有：
 $$\left(
  \begin{array}{cc}
v_{xx}& v_{xy}\\
v_{yx}&v_{yy}\\
  \end{array}
\right)
\left(
\begin{array}{}
\xi_x\\
\xi_y\\
\end{array}
\right)
=\rho
\left(
\begin{array}{}
\xi_x\\
\xi_y\\
\end{array}
\right)$$
所以原问题实际等价于对$\left(
\begin{array}{}
X\\
Y\\
\end{array}
\right)$这个$2n\times T$的数据矩阵做主成分分析，然后将得到的主成分分别对应到$x,y$坐标中去



### 4. 作比较
#### 4.1 与一维的对比
　　考虑一种特殊的情况，当某一条轨迹恰巧可以用显示表达写出来$y=f_1(t),y=f_2(t)$，则传统的FPCA定义的内积是
$$\int f_1(t)f_2(t)dt$$
但是从轨迹的角度看，其轨迹表示为$s_1=(t,f_1(t)),s_2=(t,f_2(t))$,所以定义的内积是
$$\int t^2dt+\int f_1(t)f_2(t)dt$$
　　从中可以看到轨迹的PCA 需要同时考虑横轴和纵轴两个方向，而一维的PCA只考虑到的纵轴的方向。

#### 4.2 二维
  　　对于二维的FPCA ，其内积表达式是是一维的推广
  　　$$$$


## 2 mixed effects model
离散版本的计算方法主要是在当记录的时间间隔比较短的时候，可以很好的还原原来的轨迹情况。而且数据的时间间隔必须是一致的。??

参考joint modelling of paired sparse functional data using principle components.
【周老师的这篇论文是paired dara，形式上也是$x(t),y(t)$的形式。其思路是分别对每一个用mixed effects model做，求得主成分，然后join在一起。
与轨迹FPCA 不同：1.数据的无方向性。 2.主成分得分在两个上面要求是一样的。
可以用zhou老师的方法去做一遍
】
### 1.基本模型
假设提取出J个主成分轨迹，则有
$$X_i(t)=\mu(t)+\sum_{j=1}^Jf_j(t)\alpha_{ij}+\epsilon_i(t)=\mu(t)+f(t)^T\alpha_i+\epsilon_i(t)$$
$$Y_i(t)=v(t)+\sum_{j=1}^Jg_j(t)\alpha_{ij}+\epsilon_i(t)=v(t)+g(t)^T\alpha_i+\xi_i(t)$$
其中$\mu(t),v(t)$分别是$x和y$方向上的均值曲线，$f=(f_1,\cdots,f_J)^T$,$g=(g_1,\cdots,g_J)^T$,$\epsilon_i(t),\xi_i(t)$是观测误差，并且假设$\alpha_i,\epsilon_i,\xi_i$均值是0，不相关。而主成分要满足正交限制
$$\int f_if_j+\int g_ig_j=\delta_{ij}$$
为了参数的可识别性，主成分得分$\alpha_{ij}(j=1,\cdots,J)$是独立的，并且有严格递减的方差。记$\alpha_i$的对角方差阵为$D$

记$b(t)=\{b_1(t),\cdots,b_q(t)\}$为样条基函数，维度q，且满足$\int b_j(t)b_l(t)=\delta_{jl}$.
记$$\mu(t)=b(t)^T\theta_{\mu},v(t)=b(t)^T\theta_{v}$$
$$f(t)^T=b(t)^T\Theta_f,g(t)^T=b(t)^T\Theta_g$$
对于观测数据，轨迹$s_i$,时间间隔是$t_{i1},\cdots,t_{in_i}$
记$X_i=\{X_i(t_{i1}),\cdots,X_i(t_{in_i})\}$,类似的$Y_i$。$B=\{b_i(t_{i1}),\cdots,b_i(t_{in_i})\}$.观测数据的模型可以写成：

$$X_	i=B_i\theta_{\mu}+B_i\Theta_f\alpha_i+\epsilon_i$$
$$Y_	i=B_i\theta_v+B_i\Theta_g\alpha_i+\xi_i$$
$$\epsilon_i ~(0,\sigma^2_{\epsilon}I_{n_i}),\xi_i ~(0,\sigma^2_{\xi}I_{n_i}),\alpha_i~(0,D)$$

并且为了保证模型的可识别，假设$\Theta^T_f\Theta^T_f=I,\Theta^T_g\Theta^T_g=I$,以及其他的一些条件。。。。。

### 2.惩罚
【需不需要加惩罚？？实际估计应该是折线情况】
为了使求得的主成分轨迹比较光滑，可以对粗糙程度进行惩罚。比如如下的形式
$$\lambda_{\mu}\int \mu''(t)^2dt+\lambda_{f_1}\int f_1''(t)^2dt+\cdots+\lambda_{f_k}\int f_k''(t)^2dt$$
为了简单起见，可以对主成分加一样的罚参数
$$P_1=\lambda_{\mu}\theta_{\mu}^T\int b''(t)b''(t)^Tdt\theta_{\mu}+\lambda_f\sum_{j=1}^d\theta_{fj}^T\int b''(t)b''(t)^Tdt\theta_{fj}$$
类似的有
$$P_2=\lambda_{\mu}\theta_{\mu}^T\int b''(t)b''(t)^Tdt\theta_{\mu}+\lambda_f\sum_{j=1}^d\theta_{fj}^T\int b''(t)b''(t)^Tdt\theta_{fj}$$




## 3 具体实施细节
#### 3.1 轨迹的分段

另外，对于两个轨迹完全相同，只是方向不一样的轨迹，其在刻画轨迹时的效果是一样的，但是按照上面定义的内积形式却是不一样的。对于样本量n的样本，若两两轨迹之间都需要判断最合适的方向，会面临$n^2$数量级的运算，尤其是在实际运用中，当轨迹的数量(比如一个城市的出租车)很多的时候，其效用就不高了。

因为一辆出租车一天的轨迹比较长，而且形状比较不规则，对于判断其方向比较麻烦，所以需要将轨迹进行分段。
另一方面，若轨迹被分割的太细，样本量将会增大，学出来的PCA所含的噪音会较大，而且有可能是不完整的片段。
所以需要一个合适的切分方法。
比如按照时间段的划分，根据人们的出行规律，划分为早上上班期，早上到下午，晚上下班期，半夜时段。
或者只研究固定的某个时段。
或者按照载客与不载客划分

#### 3.2 方向确定
通过以上划分后，轨迹一般不会太长
#### shift registration
#### 3.3 插值对齐
在离散版本中，每一条轨迹的采样时间不是固定的，即使都将时间对齐到[0,1]之间。所以为了便于计算，采取等间距的方式将[0,1]划分成N个小区间段，对每个knot利用插值的方法将数据补全




-----

d(f*g)/dx=(df'/dx)g+(dg/dx)f'
结论
d(x'Ax)=(d(x'')/dx)Ax+(d(Ax)/dx)(x'')=Ax+A'x