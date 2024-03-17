function [n,c,yc] = regula(f,a,b,delta,epsilon,max1)%max1不能提前算，所以要自己输入
digits(7) 
ya=feval(f,a);
yb=feval(f,b);
if ya*yb>0
    disp('Note:f(a)*f(b)>0');
    return,
end
for k=1:max1
    dx=yb*(b-a)/(yb-ya);
    c=b-dx;
    ac=c-a;
    yc=feval(f,c);
    if yc==0 
        break;
    elseif yb*yc>0 %向左压缩
        b=c;
        yb=yc;
    else %向右压缩
        a=c;
        ya=yc;
    end
    dx=min(abs(dx),ac);
    if abs(dx)<delta,break,end
    if abs(yc)<epsilon,break,end
end
n=k;
c;
% err;%半区间长度，与二分法作比较，可以不要
yc=feval(f,c);




