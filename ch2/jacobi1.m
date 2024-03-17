function [X,k] = jacobi1(A,B,P,delta,max1)
%Input -A is an N×N nonsigular matrix
%      -B is an N×1 matrix
%      -P is an N×1 matrix;X的初始迭代值
%       P中存放着每一次迭代的前一次迭代的值x_{k}
%       X中存着这一次迭代的迭代值x_{k+1}
% digits(7);
N=length(B);
for k=1:max1
    for j=1:N
%         X(j)=vpa((B(j)-A(j,[1:j-1,j+1:N])*P([1:j-1,j+1:N]))/A(j,j));
        X(j)=(B(j)-A(j,[1:j-1,j+1:N])*P([1:j-1,j+1:N]))/A(j,j);
    end
    err=abs(norm(A*X'-B));
    relerr=err/(norm(A*X')+eps);
    P=X';
    if(err<delta||relerr<delta)
        break
    end 
end
X=X';
k;

