function T = rctrap(f,a,b,n)
%Input  - f is integrand input as a string 'f'
%       - a and b are upper and lower limits of integration
%       - n is the number of times of recursion
%Output - T is the recursive trapezoidal rule list
M=1;
h=b-a;
T=zeros(1,n+1);
T(1)=h*(feval(f,a)+feval(f,b))/2;
for j=1:n
    M=2*M;
    h=h/2;
    s=0;
    for k=1:M/2
        x=a+h*(2*k-1);
        s=s+feval(f,x);
    end
    T(j+1)=(T(j)/2)+h*s;
end
end

