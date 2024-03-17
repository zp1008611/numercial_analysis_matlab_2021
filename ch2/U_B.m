function [U,B] = U_B(dem)
%MATRIX_DEMO 此处显示有关此函数的摘要
%   此处显示详细说明
U=zeros(dem,dem);
for i=1:dem
    for j=1:dem
        if i<=j
            U(i,j)=cos(i*j);
        end
    end
end
B=zeros(dem,1);
for k=1:dem
    B(k)=tan(k);
end
U;
B;
end

