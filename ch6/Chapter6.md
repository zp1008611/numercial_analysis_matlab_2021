 Chapter6

##### P259 7

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210610002621142.png" alt="image-20210610002621142" style="zoom: 50%;" />

$(a)$ formula(6.19) $t_k=kh,y_k=y_0(1+hR)^k$，for $k=0,1,...,M.$

| h               | Number of iterations,M | Approximation to y(5)                     |
| --------------- | ---------------------- | ----------------------------------------- |
| $1$             | 5                      | $5000(1+0.02)^5=5520.40$                  |
| $\frac{1}{12}$  | 60                     | $5000(1+\frac{0.02}{12})^{60}=5525.39$    |
| $\frac{1}{360}$ | 1800                   | $5000(1+\frac{0.02}{360})^{1800}=5525.83$ |

$(b)$ Beause, $f(t,y)=0.02y$ satisfies Lipschitz condition in $[0,5]$. So the solution of the differential equation satisfying the above initial conditions is $y=5000e^{0.02x}$，so if $h\rightarrow 0,y_k\rightarrow 5000e^{0.1}=5525.85$.

##### P259 8

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210610002652426.png" alt="image-20210610002652426" style="zoom: 50%;" />

```matlab
>> f=@(x,v)32-0.032*v^(3/2);
E = euler(f,0,6,0,120);
E(end)

ans =

  92.497908568731191
```

 Using Euler's method with h=0.5 and estimate $v(6)=92.4979$.

<div STYLE="page-break-after: always;"></div>

##### P259 9

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210608235943768.png" alt="image-20210608235943768" style="zoom:80%;" />

 <img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210609220654275.png" alt="image-20210609220654275" style="zoom:80%;" />

$(a)-(b)$ As shown below:

```matlab
>> clear 
f=@(t,y)0.00003*y*(25000-y);
E = euler(f,0,60,250,60);
```

 <img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210609221147419.png" alt="image-20210609221147419" style="zoom:50%;" />      <img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210609221234106.png" alt="image-20210609221234106" style="zoom: 50%;" />

```matlab
plot(E(:,1),E(:,2))
set(gca,'YLim',[min(E(:,2))-1000 max(E(:,2))+1000]);
```

 <img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210609220812072.png" alt="image-20210609220812072" style="zoom: 45%;" />

$(c)$ the average of ordinates from Euler's method in part(a) is $21775$.

```matlab
>> mean(E(:,2))

ans =

   2.1775e+04
```

$(d)$ Beause, $f(t,y)=ky(L-y),L=25,000,k=0.00003$ satisfies Lipschitz condition in $[0,60]$. So the differential equation satisfying the above initial conditions has solutions like $y=A\frac{e^{Cx}}{B+e^{Cx}}$, we using fminsearch to find the fitting curve.

```matlab
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

>> x=fminsearch(@Ea,[2500,0.02,0.8])

x =

   1.0e+04 *

   2.504108529150004   0.028064769646206   0.000074886999177
```

So we get the best fitting curve $y=25041\frac{e^{0.75x}}{280+e^{0.75x}}$.

```matlab
>> plot(E(:,1),E(:,2))
set(gca,'YLim',[min(E(:,2))-1000 max(E(:,2))+1000]);
hold on
y=25041*(exp(0.75*E(:,1)))./(280+exp(0.75*E(:,1)));
plot(E(:,1),y)
legend('OriginalData','FittingCurve')
```

  <img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210610000157612.png" alt="image-20210610000157612" style="zoom:50%;" />

```matlab
>> g=@(x)25041*(exp(0.75*x))./(280+exp(0.75*x));
>> s = simprl(g,0,60,100);
>> s/60

ans =

     2.190344354432439e+04
```

the average number of individuals infected by fitting a curve to the data from part(a) and using the mean value theorem for integrals is $21904$.

<div STYLE="page-break-after: always;"></div>

##### P267 6

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210609001646479.png" alt="image-20210609001646479" style="zoom: 80%;" />

```matlab
>> clear 
f=@(t,v)-32-0.1*v;
H = huen(f,0,30,160,60);
x=0:0.5:30;
y=480*exp(-x/10)-320;
plot(x,H(:,2),x,y)
legend('Huen','exact')
```

 As shown below:

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210610000343697.png" alt="image-20210610000343697" style="zoom:40%;" /><img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210610000429361.png" alt="image-20210610000429361" style="zoom:40%;" />

##### P267 7

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210609001659258.png" alt="image-20210609001659258" style="zoom: 67%;" />

```matlab
>> clear 
R=@(S,R)1/S;
H = huen(R,0.1,5.1,0,50);
plot(H(:,1),H(:,2))
```

 <img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210610002149517.png" alt="image-20210610002149517" style="zoom:40%;" />  <img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210610002329155.png" alt="image-20210610002329155" style="zoom:40%;" />

the solution of the differential equation satisfying the above initial conditions is shown in the picture:

 <img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210612221207331.png" alt="image-20210612221207331" style="zoom:50%;" />

