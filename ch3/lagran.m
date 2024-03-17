function [C] = lagran(X,Y)
% function [C,L] = lagran(X,Y)
%Input  - X is a vector that contains a list of abscissas
%       - Y is a vector that contains a list of ordinates
%Output - C is a matrix that contains the coefficients of 
%         the Lagrange interpolatory polynomial
%       - L is a matrix that contains the Lagrange 
%         cofficient polynomials
%   此处显示详细说明
w=length(X);
n=w-1;
L=zeros(w,w);
for k=1:n+1
    V=1;
    for j=1:n+1
        if k~=j
            V=conv(V,poly(X(j)))/(X(k)-X(j));
        end
    end
    L(k,:)=V;
end
C=Y*L;
end

