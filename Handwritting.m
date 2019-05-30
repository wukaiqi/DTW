clear 
clc
%PHI_code
path = '.\SVC sample Data\';
name = 'USER1';
%name �����Ŀ��֮һ��һ��ֻ����һ��Ŀ��ıʼǣ� �ڵ�������ʱ name=Ŀ�� ��name = USER1��
format = '.txt';
x_label = [];
y_label = [];
l_label = [];
s = 300;%dΪǩ�����Ӷ� ���ڹ�������ʱ���������ĳ���

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
x1 = de_noise(x1);%ȥ��
y1 = de_noise(y1);
x1 = mapminmax(x1);%��һ��
y1 = mapminmax(y1);
x1 = gauss_filter(x1);%��˹��ͨ�˲�
y1 = gauss_filter(y1);
[x1,y1] = feature_point2D(x1,y1);%��ȡ������
xy1 = x1+y1;
dtw_output = [];%�洢dwt������

for i = 1:40
   x2 = x_label(1:l_label(i)-1,i)';
   y2 = y_label(1:l_label(i)-1,i)';
   x2 = de_noise(x2);%ȥ��
   x2 = mapminmax(x2);%��һ��
   x2 = gauss_filter(x2);%��˹��ͨ�˲�
   y2 = de_noise(y2);
   y2 = mapminmax(y2);
   y2 = gauss_filter(y2);
   [x2,y2] = feature_point2D(x2,y2);
   xy2 = x2+y2;
   D = dtw(xy1,xy2);
   dtw_output = [dtw_output,D];
end






