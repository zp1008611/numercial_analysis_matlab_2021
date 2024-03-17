function S = aa(f,a,b)
%AA 此处显示有关此函数的摘要
%   此处显示详细说明
syms x
ff=diff(f,x,4);
t=a:(b-a)/1000:b;
m=abs(ceil(max(subs(ff,t))));
syms K;
eqn=((b-a)^5*m)/(180*K)==1e-10;%K=M^4
S=ceil(solve(eqn));
end

