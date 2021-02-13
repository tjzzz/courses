# Part1 模拟
## 问题说明
详见latex文档
　　对于回归树来说：给定训练集$D={(X_i,y_i)}$,一个回归树对应着输入空间的一个划分以及在划分空间上的输出值。假设输入空间可以划分为M个类，$R_1,R_2,\cdots, R_M$.并且在每个类上有一个固定的输出值$c_m$。则模型可以写成$y=\sum_{m=1}^Mc_mI(x\in R_m)$\\

对于threshold regression来说，假设真实的模型是：
$$y=\beta_0+\beta_1I(x_1>t_1)+\beta_2I(x_2>t_2)+\epsilon$$
其可以写为$$y=\beta_0I(X_i\in R_1)+(\beta_0+\beta_1)I(X_i\in R_2)+(\beta_0+\beta_2)I(X_i\in R_3)+(\beta_0+\beta_1+\beta_2)I(X_i\in R_4)$$
其中$R_i$是$x$之间不同的排列组合组成的4类。当然这里还对系数之间有一些潜在的约束。模型可以视为4个类的输出，$c_m$相当于每一类的均值。

----
##2性质证明
假设真实的模型是
$$y=\beta_0+\beta_1I(x_1>t_1)+\beta_2I(x_2>t_2)+\epsilon$$即相当于数据的生成机制是
$$y=\beta_0I(X_i\in R_1)+(\beta_0+\beta_1)I(X_i\in R_2)+(\beta_0+\beta_2)I(X_i\in R_3)+(\beta_0+\beta_1+\beta_2)I(X_i\in R_4)+\epsilon$$

基本的一些假定：

* 各个变量$I(x_i>t_i)$之间是相互独立的
* 系数$\beta$都是大于0


### 1.CART中的node顺序与系数$\beta$一致
按照CART生成树的算法:
选择第$j$个变量$X_j$和他的一个切分点$s$划分成两个区域
$$R_1(j,s)=\{x_j\le s\}和R_2(j,s)=\{x_j> s\}$$
然后寻找最优切分变量和切分点使得
$$min_{j,s}[min_{c_1}\sum_{x_i\in R_1}(y_i-c_1)^2+min_{c_2}\sum_{x_i\in R_2}(y_i-c_2)^2]$$
而对于固定的j,易知$\hat c_m=mean(y_i|x_i\in R_m)$
所以其实相当于寻找
$$min_{j,s}[\sum_{x_i\in R_1}(y_i-\bar y_1)^2+\sum_{x_i\in R_2}(y
_i-\bar y_2)^2]$$

即相当于是是两类的样本方差之和达到最小


【引理1】在选定$X_i$做根结点时，最优的切分点划分的0-1属性结果可以保证以概率收敛到真实模型的划分结果。
Proof：
　　在给定$X_i$作为当前的Node point的时候，根据样本寻找的$\hat{s}_i$对于分类结果与真实情况可能会有误差，记$q_{i,j}$表示样本数据判断是$j$的类中，真实水平是$i$的概率($i,j=0或1$)，即$q_{1,0}+q_{0,0}=1,q_{1,1}+q_{0,1}=1$
　　在给定$\hat{s}_i$的条件下，$I(X_i>t_i)$的二项分布的参数$p=p_3$在每个类中会有所改变。即分别是$b(n_1,q_{1,1})和b(n_2,q_{1,0})$
　　记$L=\sum_{x_i\in R_1}(y_i-\bar y_1)^2+\sum_{x_i\in R_2}(y_i-\bar y_2)^2$
　    根据大数定律，$n\rightarrow \infty $时样本方差收敛到总体方差，则在以上的符号假定下有
　　$$E(L)=n_1var_{R_1}(y)+n_2Var_{R_2}(y)$$

$$var_{R_1}(y)=\sum_{j\ne i}\beta^2_jp_j(1-p_j)+\beta_i^2q_{1,1}(1-q_{1,1})+\sigma^2_{\epsilon}$$
$$var_{R_2}(y)=\sum_{j\ne i}\beta^2_jp_j(1-p_j)+\beta_i^2q_{1,0}(1-q_{1,0})+\sigma^2_{\epsilon}$$
$E(L)=n\sum_{j\ne i}\beta^2_jp_j(1-p_j)+n_1\beta_i^2q_{1,1}(1-q_{1,1})+n_2\beta_i^2q_{1,0}(1-q_{1,0})+n\sigma^2_{\epsilon}$

所以在给定$X_i$的条件下，只有当$q_{1,1}=1,q_{1,0}=0$的时候才能达到最小值(其他情况，比如$q_{1,1}=0,q_{1,0}=1$都不合理)
即$\hat{s}_j$所产生的划分与真实的模型一致的时候才能达到最小值。

【Q1系数的一致性】
证明：在引理1下，选取$X_i$所对应的最小方差是
$$S(X_i)=n(\sum_{j\ne i}\beta^2_j p_j(1-p_j)+\sigma^2_{\epsilon})$$
$$S(X_i)=n(\sum_{j}\beta^2_j p_j(1-p_j)+\sigma^2_{\epsilon}-\beta_i^2p_i(1-p_i))$$
即选择变量的顺序是按照$\beta_i^2p_i(1−p_i)$的顺序来的。

【Q2 cut point的一致性】
（1）引理1已经说明，估计的cut point即使数值与真实的不一样，但是其分类的效果是一致的。
（2）当树有多层结构的时候，从一个节点向下进行二分叉的时候，由于假定示性变量之间是相互独立的。cut point的估计效果与真实值的效果是一致的，所以分叉下去的两边的数据的分布是一致的,$y=\sum_{j\ne i}\beta_j I(X_j>t_j)+\epsilon$,两边相当于是独立实验，依次类推。
每一个cut point都会收敛到真实的分类效果。


【Q3 $\beta$系数的估计】
当按照事先设定的停止条件算法终止后，由于每一个cut point的估计都是与真实模型效果一致的，所以实际上树的结果显示出了数据本来的生成机制。

![数据](https://raw.githubusercontent.com/tjzzz/Stackedit/master/fig/plot1.png)

![enter image description here](https://raw.githubusercontent.com/tjzzz/Stackedit/master/fig/sig01.png)

　　即最终的分类的结果，就是原始数据生成模型中对应的几类，每一类都可以概率收敛到真实的类中，对每一个叶子节点A有
$$y_m=c_m+\epsilon$$
$\hat{c}_m=mean(R_m)$是$c_m$的无偏相合估计，所以$c_m$也是$\beta$系数线性组合的相合估计。
   在估计系数$\beta$的时候，因为是[超定方程组](http://baike.baidu.com/view/1760039.htm?fr=aladdin)，所以需要用最小二乘的方法，而其设计矩阵$R_{2^p*(p+1)}$显然是列满秩的，例如$p=2$时，$R=\left( 
\begin{array} {}
1 & 0 & 0 \\
1 & 1 & 0 \\
1 &1&1\\
1 & 1 & 1 
\end{array}
\right) $
所以存在唯一的最小二乘无偏估计$\hat{\beta}=(R^TR)^{-1}R^T\hat{C}$，且有$(R^TR)^{-1}R^TC=(R^TR)^{-1}R^TR\beta=\beta$，而$\hat{C}$是C的相合估计，所以做用一个函数后，$\hat{\beta}$也是$\beta$的相合估计。
