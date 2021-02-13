#location 
## 1.数据说明
### 数据分为3类  
1. 省外来四川数据
2. 省内漫游
3. 本地数据

这里研究的对象是本地的数据，并且可以先选择一个行政区域进行研究，以city=285的成都为例。
数据说明：

- 数据字段包括时间(目前是精确到小时)、calling电话号码、所在的Lac和cell编号（这个编号可以对应出所在的基站的经纬度），来源市和漫游市
- 所用的数据时间是20140514.10~20140516.06

## 2.数据处理
```{r,echo=FALSE}
#load the data
#导入数据
create table t1 like 83init;
load data local infile 'F:/location/83_hour/hour_83.log.20140514.100000' into table t1 fields terminated by ','
(time,calling,lac,cell,city,@tt,@tt,@tt) ;
```
mysql中间出了些问题，ERROR 2013 (HY000): Lost connection to MySQL server during query
所以将city=285的导出了2个文件，有重复的
```
into outfile 'F:/location/83_hour/285data_part2.txt';

#尝试将285data_part1和part2合并到ttt表中
load data local infile 'F:/location/83_hour/285data_part1.txt' into table ttt;
load data local infile 'F:/location/83_hour/285data_part2.txt' into table ttt;
### done    SAS导入果然很快


#筛选出不重复的
select distinct * from ttt
into outfile 'F:/location/83_hour/285final.txt';

#建立表
load data local infile 'F:/location/T2_285data/285final.txt' into table t285
(time,calling,lac,cell,@tt);

load data local infile 'F:/location/T2_285data/cell285.txt' into table cell285
ignore 1 lines;


###记录count
select calling, count(distinct cell) from t285
group by calling
into outfile 'F:/location/T2_285data/count.txt';
##之后得排下序
```

最终city=285的distinct的记录数是 10321143
calling的量级是一百万

###count
count表中的记录显示，在观测时间内，cell改变数最多的是359，当然大部分的人cell基本上没有变化。

---
2014-10-10
选择几个count较大的人，先看下轨迹情况(长度，环形？？)
 