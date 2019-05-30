function [output_x] = feature_point(x)
l = length(x);
a = [];
for i = 2:l-1
    x1 = x(i)-x(i-1);
    x2 = x(i)-x(i+1);
    if x1*x2 >= 0 
        a=[a,x(i)];
    end    
output_x = a;

end
