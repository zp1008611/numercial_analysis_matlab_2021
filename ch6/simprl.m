function s = simprl(f,a,b,M)
%Input  - f is 
%       - a and b are upper and lower limits of integration
%       - M is the number of subintervals
%Output - s is the trapezoidal rule sum

h=(b-a)/(2*M);
s1=0;
s2=0;
for k=1:M
    x=a+h*(2*k-1);
    s1=s1+feval(f,x);
end
for k=1:(M-1)
    x=a+h*2*k;
    s2=s2+feval(f,x);
end
s=h*(feval(f,a)+feval(f,b)+4*s1+2*s2)/3;
end

