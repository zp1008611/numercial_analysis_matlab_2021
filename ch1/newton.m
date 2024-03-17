function [P,err,k,y] = newton(f,df,p0,delta,epsilon,max1)
digits(7)
P(1)=vpa(p0);
for k=1:max1
    p1=p0-feval(f,p0)/feval(df,p0);
    y(k)=vpa(feval(f,p0));
    err=abs(p1-p0);
    relerr=2*err/(abs(p1)+delta);
    p0=p1;
    P(k+1)=vpa(p0);
    if(err<delta)|(relerr<delta)|(abs(y)<epsilon)
        break
    end
end

