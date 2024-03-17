function s = traprl(f,x,y,n)
%Input  - f is 
%       - a and b are upper and lower limits of integration
%       - M is the number of subintervals
%Output - s is the trapezoidal rule sum

s=0
for k=1:n
    s=s+feval(f,x);%x1¼Óµ½x19
end
s=(h*(feval(f,a)+feval(f,b))/2)+h*s;
end

