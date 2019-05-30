x1 = x_label(1:l-1,1)';
y1 = y_label(1:l-1,1)';
x4 = mapminmax(x1);%归一化
y4 = mapminmax(y1);
%de_noise(x，d) 去除噪声
%gauss_filter(x) 高斯低通滤波
%feature_point2D(x,y) 二维特征点提取
%feature_point(x) 一维特征点提取
x2 = gauss_filter(x1);
y2 = gauss_filter(y1);

x3 = de_noise(x1);
y3 = de_noise(y1);

[x5,y5] = feature_point2D(x1,y1);

figure;
subplot(1,4,1);plot(x1,y1,'.');
xlabel('高斯滤波前的序列');
subplot(1,4,2);plot(x2,y2,'.');
xlabel('高斯滤波后的序列');
subplot(1,4,3);plot(x3,y3,'.');
xlabel('去噪之后的序列')
subplot(1,4,4);plot(x4,y4,'o');
xlabel('归一化')




