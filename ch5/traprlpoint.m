function s = traprlpoint(x,y,n)
%Input  - f is 
%       - a and b are upper and lower limits of integration
%       - M is the number of subintervals
%Output - s is the trapezoidal rule sum

s=0;
for k=2:n
    s=s+(x(k)-x(k-1))*(y(k)+y(k-1))/2;
end
end

