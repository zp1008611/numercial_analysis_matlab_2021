function [A,err] = nonlinearity(X,Y,M)
%Input  - X is the 1¡Án abscissa vector 
%       - Y is the 1¡Án ordinate vector
%       - Fx is the 1¡Án function value vector
%Output - A is the coefficient of x in Ax+B
%       - B is the constant coefficient in Ax+B   
x2M=X.^(2*M)
C=cumsum(x2M);
sumx2M=C(end)
xMy=X.^M.*Y
C=cumsum(xMy);
sumxMy=C(end)
A=sumxMy/sumx2M;
Fx=A*X.^M
N=length(Fx);
err=(((Fx-Y)*(Fx-Y)')/N)^(1/2);
end

