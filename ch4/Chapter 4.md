Chapter 4

##### P160 4

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210521201641045.png" alt="image-20210521201641045" style="zoom:67%;" />

```matlab
%isline.m
function [A,B,err] = isline(X,Y)
%Input  - X is the 1×n abscissa vector 
%       - Y is the 1×n ordinate vector
%       - Fx is the 1×n function value vector
%Output - A is the coefficient of x in Ax+B
%       - B is the constant coefficient in Ax+B   
xmean=mean(X);
ymean=mean(Y);
sumx2=(X-xmean)*(X-xmean)';%1×1
sumxy=(Y-ymean)*(X-xmean)';
A=sumxy/sumx2;
B=ymean-A*xmean;
Fx=A*X+B;
N=length(Fx);
err=(((Fx-Y)*(Fx-Y)')/N)^(1/2);
end
```

```matlab
>> k=1:50;
X=0.1*k;
Y=X+cos(k.^(1/2));
[A,B,err] = isline(X,Y)

A =
    1.4186

B =
   -0.8808

err =
    0.4032

>> scatter(X,Y,'filled')
hold on
plot(X,A*X+B)
```

$(a)$ the least-squares line is $f(x)=1.1486x-0.8808$.
$(b)$ $E_2(f)=\sqrt{\frac{\sum\limits_{k=1}^{N}(f(x_k)-y_k))^2}{N}}=0.4032$.

$(c)$ As shown below:

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210521211314956.png" alt="image-20210521211314956" style="zoom:50%;" />

##### P174 1

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210521201728659.png" alt="image-20210521201728659" style="zoom:67%;" />

```matlab
function z=E(u)
A=u(1);
B=u(2);
C=u(3);
D=u(4);
E=u(5);
t=1:24;
d=[58,58,58,58,57,57,57,58,60,64,67,68,66,66,65,64,63,63,62,61,60,60,59,58];
z=0
for i=1:24
	z=z+(A*cos(B*t(i))+C*sin(D*t(i))+E-d(i)).^2;
end
end

>> options=optimset('PlotFcns',@optimplotfval,'MaxIter',5000,'MaxFunEvals',5000,'TolFun',1e-12,'Tolx',1e-12);
>> x=fminsearch(@E,[-0.9924,338,10.4823,0.1111,53.6353],options)
x =
   -0.9932  346.4002   10.4821    0.1111   53.6355

scatter(t,d,'filled')
hold on
plot(t,x(1)*cos(x(2).*t)+x(3)*sin(x(4).*t)+x(5))
```

$(a)$ The fitting curve obtained by fminsearh is$f(t)=-0.9932cos(346.4002t)+10.4821sin(0.1111t)+53.6355$.
$(b)$ It can be seen $E_2(f)=96.9586$ from the figure below：

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210611232406858.png" alt="image-20210611232406858" style="zoom:50%;" />

$(c)$ As shown below:

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210521215126317.png" alt="image-20210521215126317" style="zoom:50%;" />

<div STYLE="page-break-after: always;"></div>

##### P191 5

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210521202245143.png" alt="image-20210521202245143" style="zoom:67%;" />

```matlab
%Natural Spline.m
function [S,M]=nsfit(X,Y)
%Input  -X is the 1×n abscissa vector
%       -Y is the 1×n ordinate vector
%       -dx0=S'(x0) first derivative boundary condition
%       -dxn=S'(xn) first derivative boundary condition
%Output -S: rows of S are the coefficients,in descending
%           order,for the cubic interpolants
N=length(X)-1;
H=diff(X);
D=diff(Y)./H;
A=H(2:N-1);
B=2*(H(1:N-1)+H(2:N));
C=H(2:N);
U=6*diff(D);

B(1)=B(1);  
U(1)=U(1);
B(N-1)=B(N-1);
U(N-1)=U(N-1);
for k=2:N-1
    temp=A(k-1)/B(k-1);
    B(k)=B(k)-temp*C(k-1);
    U(k)=U(k)-temp*U(k-1);
end
M(N)=U(N-1)/B(N-1);
for k=N-2:-1:1
    M(k+1)=(U(k)-C(k)*M(k+2))/B(k);
end
M(1)=0;
M(N+1)=0;
for k=0:N-1
    S(k+1,1)=(M(k+2)-M(k+1))/(6*H(k+1));
    S(k+1,2)=M(k+1)/2;
    S(k+1,3)=D(k+1)-H(k+1)*(2*M(k+1)+M(k+2))/6;
    S(k+1,4)=Y(k+1);
end
end
```

```matlab
>> X=1:12;
Y=[58,58,58,58,57,57,57,58,60,64,67,68];
[S,M]=nsfit(X,Y);
scatter(X,Y,'filled')
for i=1:11
x=i:0.01:i+1;
y=polyval(S(i,:),x-X(i));
hold on
plot(x,y)
end
```

The natural cubic spline interpolation is shown in the figure：

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210522110526084.png" alt="image-20210522110526084" style="zoom:50%;" />

$\int_{x_k}^{x_{k+1}}S_k(x)\ dx=$$\int_{x_k}^{x_{k+1}}[a_k(x-x_k)^3+b_k(x-x_k)^2+c_k(x-x_k)+d_k]\ dx$,
$=\frac{a_k}{4}(x-x_k)^4+\frac{b_k}{3}(x-x_k)^3+\frac{c_k}{2}(x-x_k)^2+d_kx|_{x=x_k}^{x=x_{k+1}}$

$=\frac{a_k}{4}(x_{k+1}-x_k)^4+\frac{b_k}{3}(x_{k+1}-x_k)^3+\frac{c_k}{2}(x_{k+1}-x_k)^2+d_k(x_{k+1}-x_k)$
$=(((\frac{a_k}{4}h_k+\frac{b_k}{3})h_k+\frac{c_k}{2})h_k+d_k)h_k$.
$h_k=x_{k+1}-x_{k}$.

```
>> integ=0;
h=1;
for i=1:11
integ=integ+Horner1(S(i,:),h);
end

>> integ/(12-1)

ans =

   60.1818
```

accroding to $\int_{a}^{b}f(x)\ dx=f(c)(b-a)$, the average temperature is $60.1818$.

<div STYLE="page-break-after: always;"></div>

##### P200 4(a)

 <img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210521202321187.png" alt="image-20210521202321187" style="zoom:50%;" />

$(a)$  As shown below:

 <img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210524180112614.png" alt="image-20210524180112614" style="zoom:50%;" />

```matlab
>> M1=[0,0;0,40;(0.125/2)+0.25,40;(0.125/2)+0.25*2,40;0.625,0;0.625+0.125/2,-40;0.625+0.125/2+0.25,-40;1.25,-40;1.25,0];
M2=[1.25,0;1.25,40;1.25-(0.125/2)-0.25,40;1.25-(0.125/2)-0.25*2,40;0.625,0;0.625-0.125/2,-40;0.625-0.125/2-0.25,-40;0,-40;0,0];
beziercurve(M1)
hold on
beziercurve(M2)
```

```matlab
% bezier.m
function B = bezier(i,N,t)
B=(factorial(N)/(factorial(i)*factorial(N-i)))*(t.^(i)).*((1-t).^(N-i));
end
```

```matlab
% beziercurve.m
function beziercurve(M)
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
plot(x,y)
end
```

