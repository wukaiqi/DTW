clear 
clc
%PHI_code
path = '.\SVC sample Data\';
name = 'USER1';
%name 是五个目标之一，一次只分析一个目标的笔记， 在导入数据时 name=目标 例name = USER1。
format = '.txt';
x_label = [];
y_label = [];
l_label = [];
s = 300;%d为签名复杂度 用于构建矩阵时补齐向量的长度

for i = 1:40  
    filename = sprintf('%s%s_%d%s',path,name,i,format);
    test = textread(filename);
    l=length(test);
    l_label =[l_label,l]; 
    x = test(2:l,1);
    y = test(2:l,2);
    x = [ x ; zeros(s-length(x),1)];
    y = [ y ; zeros(s-length(y),1)];
    x_label = [x_label,x];
    y_label = [y_label,y]; 
end

l = l_label(1);
plot(x_label(1:l-1,1),y_label(1:l-1,1));

x1 = x_label(1:l_label(1)-1,1)';
y1 = y_label(1:l_label(1)-1,1)';
x1 = de_noise(x1);%去噪
y1 = de_noise(y1);
x1 = mapminmax(x1);%归一化
y1 = mapminmax(y1);
x1 = gauss_filter(x1);%高斯低通滤波
y1 = gauss_filter(y1);
[x1,y1] = feature_point2D(x1,y1);%提取特征点
xy1 = x1+y1;
dtw_output = [];%存储dwt计算结果

for i = 1:40
   x2 = x_label(1:l_label(i)-1,i)';
   y2 = y_label(1:l_label(i)-1,i)';
   x2 = de_noise(x2);%去噪
   x2 = mapminmax(x2);%归一化
   x2 = gauss_filter(x2);%高斯低通滤波
   y2 = de_noise(y2);
   y2 = mapminmax(y2);
   y2 = gauss_filter(y2);
   [x2,y2] = feature_point2D(x2,y2);
   xy2 = x2+y2;
   D = dtw(xy1,xy2);
   dtw_output = [dtw_output,D];
end






