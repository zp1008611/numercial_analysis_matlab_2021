figure;
x=-1.5:0.001:2;
g=x.^2-sin(x+15);
dg=2*x-cos(x+0.15);
y=x;
plot(x,g,'LineWidth',1)
hold on
plot(x,y)
hold on 
plot(x,dg)
hold on
plot([-1.5,2],[1,1],'--')
hold on
plot([-1.5,2],[-1,-1],'--')
hold on 
line([-0.588,-0.588],[-4,5]);
hold on 
line([0.825,0.825],[-4,5]);
legend('g(x)','y=x',"g'(x)")


