function plott(X)
x=0:0.1:1;
f=exp(x);
plot(x,polyval(X,x),x,f)
legend('p(x)','f(x)')
end

