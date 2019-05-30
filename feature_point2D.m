function [output_x,output_y] = feature_point2D(x,y)
l = length(x);
a = [];
b = [];
for i = 2:l-1
    x1 = x(i)-x(i-1);
    x2 = x(i)-x(i+1);
    y1 = y(i)-y(i-1);
    y2 = y(i)-y(i+1);
    if x1*x2 > 0 || y1*y2 > 0
        a=[a,x(i)];
        b=[b,y(i)];
    end    
output_x = a;
output_y = b;

end
