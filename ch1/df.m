function [output] = df(x)
syms k
f=(k-3)^(1/2);
df=diff(f);
k=x;
output=eval(df);
end

