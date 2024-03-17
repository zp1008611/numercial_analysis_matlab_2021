%Natural Spline
function [S,M]=nsfit(X,Y)
%Input  -X is the 1¡Án abscissa vector
%       -Y is the 1¡Án ordinate vector
%       -dx0=S'(x0) first derivative boundary condition
%       -dxn=S'(xn) first derivative boundary condition
%Output -S: rows of S are the coefficients,in descending
%           order,for the cubic interpolants
N=length(X)-1;
H=diff(X);
D=diff(Y)./H;
A=H(2:N-1);
B=2*(H(1:N-1)+H(2:N));
C=H(2:N);
U=6*diff(D);

B(1)=B(1);  
U(1)=U(1);
B(N-1)=B(N-1);
U(N-1)=U(N-1);
for k=2:N-1
    temp=A(k-1)/B(k-1);
    B(k)=B(k)-temp*C(k-1);
    U(k)=U(k)-temp*U(k-1);
end
M(N)=U(N-1)/B(N-1);
for k=N-2:-1:1
    M(k+1)=(U(k)-C(k)*M(k+2))/B(k);
end
M(1)=0;
M(N+1)=0;
for k=0:N-1
    S(k+1,1)=(M(k+2)-M(k+1))/(6*H(k+1));
    S(k+1,2)=M(k+1)/2;
    S(k+1,3)=D(k+1)-H(k+1)*(2*M(k+1)+M(k+2))/6;
    S(k+1,4)=Y(k+1);
end
end

