function [n,c,yc] = regula(f,a,b,delta,epsilon,max1)%max1������ǰ�㣬����Ҫ�Լ�����
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
    elseif yb*yc>0 %����ѹ��
        b=c;
        yb=yc;
    else %����ѹ��
        a=c;
        ya=yc;
    end
    dx=min(abs(dx),ac);
    if abs(dx)<delta,break,end
    if abs(yc)<epsilon,break,end
end
n=k;
c;
% err;%�����䳤�ȣ�����ַ����Ƚϣ����Բ�Ҫ
yc=feval(f,c);




