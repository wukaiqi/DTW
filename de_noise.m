% x 为去噪的序列 ，d为筛选区间
function [output] = de_noise(x , d)
l = length(x);
d1=[];
% 如果d的输入值为空，则利用正太分布计算出d
if(nargin==1)
    
    for i=1:l-1
        d1 = [d1,abs(x(i)-x(i+1))];
    end
    k = floor(l*0.9974 );
    d1 = sort(d1);
    d = d1(k);
end
        
for i=2:l-1
    if abs(x(i)-x(i+1)) > d
        x(i) = (x(i-1)+x(i+1))/2;
    end
end

output = x ;

end