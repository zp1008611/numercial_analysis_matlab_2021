function beziercurve(M)
%BEZIERCURVE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

