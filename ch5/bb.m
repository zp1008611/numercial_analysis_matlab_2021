
syms x
f=(4*x-x^2)^(1/2);
for i=1:5
    t=0+eps:(2-0)/1000:2;
    ff=diff(f,x,i);
    m(i)=double(max(subs(ff,t)));
end



