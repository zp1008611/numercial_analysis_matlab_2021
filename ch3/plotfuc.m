x=-1:0.01:1;
y=cos(x);
p4=1-(1/2).*x.^2+(1/4*3*2).*x.^4;
p6=1-(1/2).*x.^2+(1/4*3*2).*x.^4-(1/6*5*4*3*2).*x.^6;
p8=1-(1/2).*x.^2+(1/4*3*2).*x.^4-(1/6*5*4*3*2).*x.^6+(1/8*7*6*5*4*3*2).*x.^8;
figure;
plot(x,y,'linewidth',2)
hold on 
plot(x,p4,'linewidth',1)
hold on 
plot(x,p6)
hold on
plot(x,p8)
hold off
legend('cosx','P4','p6','p8')