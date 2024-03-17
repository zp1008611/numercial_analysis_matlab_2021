function [L,B] = L_B(dem)
%L_B 此处显示有关此函数的摘要
%   此处显示详细说明
L=zeros(20,20);
B=zeros(20,1);
for i=1:dem
    for j=1:dem
        if i>=j
            L(i,j)=i+j;
        end
    end
end
for k=1:dem
    B(k)=k;
end
end

