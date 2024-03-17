function X = backsub(A,B)
%Input  -A是一个n×n的上三角非奇异矩阵
%       -B是一个n×1的矩阵    
%Output -X是线性方程组AX=B的解
n=length(B);    %B的维度
X=zeros(n,1);   %n×1的零矩阵
X(n)=B(n)/A(n,n);
for k=n-1:-1:1
    X(k)=(B(k)-A(k,k+1:n)*X(k+1:n))/A(k,k);
end

