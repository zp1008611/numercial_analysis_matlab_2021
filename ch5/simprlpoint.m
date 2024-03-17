function s = simprlpoint(x,y,midpointy,n)
%Output - s is the Simpson's rule sum

s=0;
for k=2:n
    h=x(k)-x(k-1);
    s=s+h*(y(k-1)+4*midpointy(k-1)+y(k))/6;
end
end

