function X = forsub(A,B)
%Input  -A是一个n×n的下三角非奇异矩阵
%       -B是一个n×1的矩阵    
%Output -X是线性方程组AX=B的解
n=length(B);    %B的维度
X=zeros(n,1);   %n×1的零矩阵
X(1)=B(1)/A(1,1);
for k=2:n
    X(k)=(B(k)-A(k,1:k)*X(1:k))/A(k,k);
end

