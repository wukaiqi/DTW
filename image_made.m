x1 = x_label(1:l-1,1)';
y1 = y_label(1:l-1,1)';
x4 = mapminmax(x1);%��һ��
y4 = mapminmax(y1);
%de_noise(x��d) ȥ������
%gauss_filter(x) ��˹��ͨ�˲�
%feature_point2D(x,y) ��ά��������ȡ
%feature_point(x) һά��������ȡ
x2 = gauss_filter(x1);
y2 = gauss_filter(y1);

x3 = de_noise(x1);
y3 = de_noise(y1);

[x5,y5] = feature_point2D(x1,y1);

figure;
subplot(1,4,1);plot(x1,y1,'.');
xlabel('��˹�˲�ǰ������');
subplot(1,4,2);plot(x2,y2,'.');
xlabel('��˹�˲��������');
subplot(1,4,3);plot(x3,y3,'.');
xlabel('ȥ��֮�������')
subplot(1,4,4);plot(x4,y4,'o');
xlabel('��һ��')




