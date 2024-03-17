function [A,B] = A_B(N)
%A_B 此处显示有关此函数的摘要
%   此处显示详细说明
A=zeros(N,N);
B=zeros(N,1);
for i=1:N
    for j=1:N
        A(i,j)=i^(j-1);
    end
end
B(1)=N;
for k=2:N
    B(k)=(k^N-1)/(k-1);
end
end

