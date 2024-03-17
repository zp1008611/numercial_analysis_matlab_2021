function [X,k] = jacobi1(A,B,P,delta,max1)
%Input -A is an N��N nonsigular matrix
%      -B is an N��1 matrix
%      -P is an N��1 matrix;X�ĳ�ʼ����ֵ
%       P�д����ÿһ�ε�����ǰһ�ε�����ֵx_{k}
%       X�д�����һ�ε����ĵ���ֵx_{k+1}
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

