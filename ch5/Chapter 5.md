##### Chapter 5

##### P222 3,4

Note: Modify the number of the known points in Exercise 3 and 4 to 13, that means k is from 0 to 12.    <img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210524181025723.png" alt="image-20210524181025723" style="zoom: 67%;" />

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210527230909058.png" alt="image-20210527230909058" style="zoom: 67%;" />  

 <img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210527230933388.png" alt="image-20210527230933388" style="zoom: 50%;" />
$x=\sqrt{k^2+1},y=k^{\frac{1}{3}}$, thus $k=\sqrt{x^2-1},y=(x^2-1)^{\frac{1}{6}}.$

```matlab
%traprlpoint.m
function s = traprlpoint(x,y,n)
%Output - s is the trapezoidal rule sum
%Input  - X is the abscissa of the point
%		- Y is the ordinate of the point
%		- n is the number of points
s=0;
for k=2:n
    s=s+(x(k)-x(k-1))*(y(k)+y(k-1))/2;
end
end
```

```matlab
%simprlpoint.m
function s = simprlpoint(x,y,midpointy,n)
%Output - s is the Simpson's rule sum
%Input  - X is the abscissa of the point
%		- midpointy is the ordinate of the midpoint of each two points
%		- Y is the ordinate of the point
%		- n is the number of points
s=0;
for k=2:n
    h=x(k)-x(k-1);
    s=s+h*(y(k-1)+4*midpointy(k-1)+y(k))/6;
end
end
```

```matlab
>> k=0:12;
x=sqrt(k.^2+1);
y=k.^(1/3);
>> s = traprlpoint(x,y,length(k))
s =
   19.5281
>>f=@(x)(x.^2-1).^(1/6); 
for i=1:length(k)-1
midpointy(i)=f((x(i)+x(i+1))/2);
end
s=simprlpoint(x,y,midpointy,length(k))
s =
   19.6571
```

3. Adapting the composite trapezoidal rule ,we can get approximated integral of the function is $19.5281$.

4. Adapting the composite Simpson's rule, we can get approximated integral of the function is $19.6571$;

<div STYLE="page-break-after: always;"></div>

##### P222 6

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210527231001255.png" alt="image-20210527231001255" style="zoom:67%;" />

```matlab
%aa.m
function S = aa(f,a,b)
%Output - S=M^4,M=(b-a)/h, h is the step size
%Input  - f
%       - a and b are the end points of the integral interval
syms x
ff=diff(f,x,4);
t=a:(b-a)/1000:b;
m=abs(ceil(max(subs(ff,t))));
syms K;
eqn=((b-a)^5*m)/(180*K)==1e-10;%K=M^4
S=ceil(solve(eqn));
end
```

```matlab
>> syms x;
f1=sin(1/x);
S1 = aa(f1,pi/7,pi/4)
S1 =
32406099
 
>> ceil(S1^(1/4))
ans = 
76
```

$(a)$ We get M is equal to $76$.

```matlab
>> format long 
f=@(x)sin(1./x);
s = simprl(f,pi/7,pi/4,76)

s =

   0.323152343496973
```

Using the composite Simpson's rule, the approximation to the definite integral with an accuracy of ten decimal places is $0.323152343496973$.

<div STYLE="page-break-after: always;"></div>

##### P236 2

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210612222746936.png" alt="image-20210612222746936" style="zoom:67%;" />

$(a)$ the approximation of the definite integral is $3.141592653228606$.

```matlab
>> clear
f=@(x)(4*x-x.^2)^(1/2); 
format long
[R,quad,err,h] = romber(f,0,2,20,1e-10)
```

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210612223434971.png" alt="image-20210612223434971" style="zoom:75%;" />

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210612223500611.png" alt="image-20210612223500611" style="zoom:75%;" />

 <img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210617154528003.png" alt="image-20210617154528003" style="zoom:50%;" /><img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210617154508347.png" alt="image-20210617154508347" style="zoom:50%;" />

$(b)$ the approximation of the definite integral is $3.141592653589723$. 

```matlab
>> clear
f=@(x)(4/(1+x.^2)); 
format long
[R,quad,err,h] = romber(f,0,1,6,1e-10)
```

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210612223859233.png" alt="image-20210612223859233" style="zoom:80%;" />

Let's see why the convergence rates of the two functions are different. Let's take a look at the derivatives of the two functions. Here we only take to order 5：

```matlab
>> syms x
f=(4*x-x^2)^(1/2);
for i=1:5
    t=0+eps:(2-0)/1000:2;
    ff=diff(f,x,i);
    m(i)=double(max(subs(ff,t)));
end
```

 <img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210612225831497.png" alt="image-20210612225831497" style="zoom:50%;" />

```matlab
>> syms x
f=4/(1+x^2);
for i=1:5
    t=0+eps:(2-0)/1000:2;
    ff=diff(f,x,i);
    m(i)=double(max(subs(ff,t)));
end
```

 <img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210612230131937.png" alt="image-20210612230131937" style="zoom:50%;" />

we can see that the odd derivative of $\sqrt{4x-x^2}$ on interval $[0,2]$ tends to infinity at some points，so the convergence speed for this function of Romberg integral is slow.

 







 









