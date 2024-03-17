function [X,k] = gseid(A,B,P,delta,max1)
%Input -A is an N×N nonsigular matrix
%      -B is an N×1 matrix
%      -P is an N×1 matrix;X的初始迭代值
%       P中存放着每一次迭代的前一次迭代的值x_{k}
%       X中存放着这一次迭代的迭代值x_{k+1}
% digits(7);
N=length(B);
for k=1:max1
    for j=1:N
        if j==1
%             X(1)=vpa((B(1)-A(1,2:N)*P(2:N))/A(1,1));
              X(1)=(B(1)-A(1,2:N)*P(2:N))/A(1,1);
        elseif j==N
%             X(N)=vpa((B(N)-A(N,1:N-1)*(X(1:N-1))')/A(N,N));
              X(N)=(B(N)-A(N,1:N-1)*(X(1:N-1))')/A(N,N);
        else
%             X(j)=vpa((B(j)-A(j,1:j-1)*X(1:j-1)'-A(j,j+1:N)*P(j+1:N))/A(j,j));
              X(j)=(B(j)-A(j,1:j-1)*X(1:j-1)'-A(j,j+1:N)*P(j+1:N))/A(j,j);
        end
    end
    err=abs(norm(X'-P));
    relerr=err/(norm(X)+eps);
    P=X';
    if(err<delta||relerr<delta)
        break
    end
end
X=X';
k;

