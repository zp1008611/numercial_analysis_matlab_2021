function z=Ea(u)
A=u(1);
B=u(2);
C=u(3);
f=@(t,y)0.00003*y*(25000-y);
E = euler(f,0,60,250,60);
s=size(E);
z=0;
for i=1:s(1)
	z=z+(A*exp(C*E(i,1))./(B+exp(C*E(i,1)))-E(i,2)).^2;
end
end

