function A = martix_A()
%A 此处显示有关此函数的摘要
%   此处显示详细说明
A=zeros(7,7);
A(1,1)=1;
a=ones(1,7);
A(2,1:7)=1;
for i=3:7
    for j=1:7
        A(i,j)=(i-1)^(j-1);
    end
end       
end

