#基于DTW的字迹识别

##数据集 
采用 SVC2004 比赛中提供的是数据集‘SVC sample Data’

##去除噪声
对于其字迹曲线中偏离程度较大的点去噪，用相邻点的中间值代替，d为筛选区间

##归一化
matlab 中的mapminmax()函数将目标序列映射到[-1,1]上

##高斯滤波
高斯低通滤波，利用卷积计算实现，sigma=0.5、1、2的滤波模板在子函数中写如，但调用没有写好需要在子函数中修改

##特征点
寻找曲线上的拐点，对于一维和二维的数据，编写了两个函数方便调用

##Dynamic Time Warping（DTW）动态时间规整算法
利用Matlab中的DTW()函数实现，其理论知识可在[https://blog.csdn.net/gdp12315_gu/article/details/55667483](https://blog.csdn.net/gdp12315_gu/article/details/55667483 "DTW理论推导")中查询

##注：
主程序是是Handwriting.m
image_made.m 是画图的程序，需要先运行主程序
其他的是封装好的函数，主程序里有介绍
feature_point和feature_point2D的区别是后者提取的是二维数据，其目的是提取位置信息中的特征点

将dtw解压到MATLAB的文件（win的根目录在C:\Users\PHI\Documents\MATLAB）目录下可以直接运行。
