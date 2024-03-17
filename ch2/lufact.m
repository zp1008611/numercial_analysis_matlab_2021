function [P,X,L,U] = lufact(A,B)
%Input  - A is an N×N matrix
%       - B is an N×1 matrix
%Output - X is an N×1 matrix containing the solution to AX=B.
%   此处显示详细说明
[N,N]=size(A);
X=zeros(N,1);
Y=zeros(N,1);
C=zeros(1,N);
R=1:N;  %存放行向量
for p=1:N-1 %p是第几行
    %找主元
    [max1,j]=max(abs(A(p:N,p)));
    %j:当把第p行当成第一行时，最大值所在行相对于第一行所在的第j行
    %max1:最大值
    %交换行
    C=A(p,:);
    A(p,:)=A(j+p-1,:);
    A(j+p-1,:)=C;
    %记录变换
    d=R(p);
    R(p)=R(j+p-1);
    R(j+p-1)=d;
    if A(p,p)==0
        'A is singular.No unique solution'
        break
    end
    %高斯消去法消去第p行第p列下的元素后，第p行p+1列到N列的变化
    for k=p+1:N
        mult=A(k,p)/A(p,p);
        A(k,p)=mult;
        A(k,p+1:N)=A(k,p+1:N)-mult*A(p,p+1:N);
    end
end
L=tril(ones(N));%单位下三角矩阵
for k=2:N
    L(k,1:k-1)=A(k,1:k-1);
end
U=triu(ones(N));
for k=1:N
    U(k,k:N)=A(k,k:N);
end
%LY=B，L是下三角矩阵,求Y
Y(1)=B(R(1));%因为换了主元，A前面乘了初等矩阵p，所以这里B也要跟着变.
for k=2:N
    Y(k)=B(R(k))-A(k,1:k-1)*Y(1:k-1);
end
%UX=Y，U是上三角矩阵，求X
X(N)=Y(N)/A(N,N);
for k=N-1:-1:1
    X(k)=(Y(k)-A(k,k+1:N)*X(k+1:N))/A(k,k);
end
P=zeros(N,N);
for i=1:N
    P(R(i),i)=1;
end
P=inv(P);
X;
L;
U;
end

