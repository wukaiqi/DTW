% x Ϊȥ������� ��dΪɸѡ����
function [output] = de_noise(x , d)
l = length(x);
d1=[];
% ���d������ֵΪ�գ���������̫�ֲ������d
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