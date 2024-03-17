function beziercurve(M)
%BEZIERCURVE 此处显示有关此函数的摘要
%   此处显示详细说明
N=length(M)-1;
t=0:0.01:1;
xp=M(:,1);
yp=M(:,2);
x=xp(1)*bezier(0,N,t);
y=yp(1)*bezier(0,N,t);
for i=1:N
    x=x+xp(i+1)*bezier(i,N,t);
    y=y+yp(i+1)*bezier(i,N,t);
end
% scatter(xp,yp,'filled')
hold on
plot(x,y)
end

