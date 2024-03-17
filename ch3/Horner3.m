function [v] = Horner3(A,X,C)
%input  - N: Degree of P(x)
%       - A: Coefficients of P(x)
%       - X: Independent variable
%output - \int P(x)
A=flip(A);
N=length(A)-1;
I=zeros(N+2,1);
I(N+2)=A(N+1)/(N+1);
for k=N+1:-1:2
    I(k)=A(k-1)/(k-1)+I(k+1)*X;
end
I(1)=C+I(2)*X;
v=I(1);
end

