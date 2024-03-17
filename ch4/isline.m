function [A,B,err] = isline(X,Y)
%Input  - X is the 1��n abscissa vector 
%       - Y is the 1��n ordinate vector
%       - Fx is the 1��n function value vector
%Output - A is the coefficient of x in Ax+B
%       - B is the constant coefficient in Ax+B   
xmean=mean(X);
ymean=mean(Y);
sumx2=(X-xmean)*(X-xmean)';%1��1
sumxy=(Y-ymean)*(X-xmean)';
A=sumxy/sumx2;
B=ymean-A*xmean;
Fx=A*X+B;
N=length(Fx);
err=(((Fx-Y)*(Fx-Y)')/N)^(1/2);
end
