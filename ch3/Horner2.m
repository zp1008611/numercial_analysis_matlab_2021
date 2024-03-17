function [v] = Horner2(A,X)
%input - N: Degree of P(x)
%      - A: Coefficients of P(x)
%      - C: Constant of integration
%      - X: Independent variable
%   此处显示详细说明
A=flip(A);
N=length(A)-1;
D=zeros(N,1);
D(N)=N*A(N+1);
for k=N:-1:2
    D(k-1)=(k-1)*A(k)+D(k)*X;
end
v=D(1);
end

