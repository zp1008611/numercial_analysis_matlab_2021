function [n,c,err,yc] = bisect(f,a,b,delta)
%BISECT 此处显示有关此函数的摘要
%   此处显示详细说明
ya=feval(f,a);
yb=feval(f,b);
if ya*yb>0
    disp('Note:f(a)*f(b)>0');
    return,
end

max1=1+round((log(b-a)-log(delta))/log(2));
for k=1:max1
    err(k)=abs(b-a);
    c=(a+b)/2;%中点
    yc=feval(f,c);
    if yc==0
        a=0;
        b=0;
    elseif yb*yc>0 %a与c之间有根
        b=c;
        yb=yc;
    else
        a=c;
        ya=yc;
    end
    if b-a<delta,break,end
end
n=k;
c=(a+b)/2;
err;
yc=feval(f,c);

