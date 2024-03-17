function [v] = Horner1(A,X)
%input - A: Coefficients of P(x)
%      - X: Independent variable
%   此处显示详细说明
le=length(X);
A=flip(A);
N=length(A)-1;
for i=1:le  
    B=zeros(N+1,1);
    B(N+1)=A(N+1);
    for k=N:-1:1
        B(k)=A(k)+B(k+1)*X(i);
    end
    v(i)=B(1);
end
% len=length(X);
% v=zeros(len,1);
% for i=1:len
%     B(N+1)=A(N+1);
%     for k=N:-1:1
%         B(k)=A(k)+B(k+1)*X(i);
%     end
%     v(i)=B(1);
% end
end

