function C = Ispoly(X,Y,M)
%input  - X is the l¡Án abscissa vector
%       - Y is the 1¡Án ordinate vector
%       - M is the degree of the least-squares polynomial
%output - C is the coefficient list for the polynomial
n=length(X);
B=zeros(1:M+1);
F=zeros(n,M+1);
for k=1:M+1
    F(:,k)=X'.^(k-1);
end
A=F'*F;
B=F'*Y;
C=A\B;
C=flipud(C);
end

