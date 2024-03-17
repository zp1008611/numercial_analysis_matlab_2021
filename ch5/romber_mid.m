function [R,quad,err,h] = romber_mid(f,a,b,n,tol)
%Input  - f
%       - a and b are upper and lower limits of integration
%       - n is the maximum number of rows in the table
%       - tol is the tolerance
M=2;
h=b-a;
err=1;
J=1;
R=zeros(4,4);
R(1,1)=h*feval(f,a+(h/2));
while((err>tol)&&(J<n)||(J<4))
    h=h/2;
    s=0;
    x=a+h/2;
    for p=1:M
        s=s+h*feval(f,x);
        x=x+h;
    end
    R(J+1,1)=s;
    M=2*M;
    for K=1:J
        R(J+1,K+1)=R(J+1,K)+(R(J+1,K)-R(J,K))/(4^K-1);
    end
    err=abs(R(J,J)-R(J+1,K+1));
    J=J+1;
end
quad=R(J,J);
end

