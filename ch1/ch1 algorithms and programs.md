#### P11 1.

Use Program 1.1 to approximate the fixed points (if any) of each function. Answers should be accurate to 12 decimal places. Produce a graph of each function and the line $y=x$ that clearly ​show any fixed points.

(c) $g(x)=x^2-sin(x+0.15)$
additional Requirement: Produce a graph of function $g(x), g'(x)$ and the line $y=x$ that clearly shows any fixed points.

```matlab
%plotfuc.m
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
```

<img src="C:\Users\pei\AppData\Roaming\Typora\typora-user-images\image-20210411142908482.png" alt="image-20210411142908482" style="zoom: 40%;" />

We can see from the graph that $g(x)$ has two fixed points within interval $[-1,1]$. But the derivatives of these two fixed points are greater than 1. Thus, they are repelling fixed points, we cannot use fixed-point iteration to find the solutions to the equation $x=g(x)$.





#### P22 1.

Find an approximation (accurate to 10 decimal places) for the interest rate $I$ that will yield a total annuity value of $\$500,000$ if $240$ monthly payments of $\$300$ are made.

**Solution:**
Let $P$ be the monthly savings and $I$ be the annual interest rate .

| Month | Principal                                 | Money After Depositing                                      |
| ----- | ----------------------------------------- | ----------------------------------------------------------- |
| $1$   | $P$                                       | $P(1+\frac{I}{12})$                                         |
| 2     | $P(1+\frac{I}{12})+P$                     | $P(1+\frac{I}{12})^2+P(1+\frac{I}{12})$                     |
| 3     | $P(1+\frac{I}{12})^2+P(1+\frac{I}{12})+P$ | $P(1+\frac{I}{12})^3+P(1+\frac{I}{12})^2+P(1+\frac{I}{12})$ |

After n month，the total amount of money $A$ is
$A=P((1+\frac{I}{12})+(1+\frac{I}{12})^2+(1+\frac{I}{12})^3+...+(1+\frac{I}{12})^n)$.
Let $r=1+\frac{I}{12}$，$A=P(r+r^2+r^3+...+r^n)=P\cdot r\frac{1-r^n}{1-r}$.
now, $P=300$, $A=500,000$, $n=240$，
$A(I)=300r\frac{1-r^{240}}{1-r}=\frac{300}{I/12}((1+\frac{I}{12})^{240}-1)(1+\frac{I}{12})$.

```matlab
%moneyf.m
function [output] = moneyf(x)
    output=(300/(x/12))*((1+(x/12))^240-1)*(1+x/12);
end

%Command line window
>> moneyf(0.15)
ans =
   4.5479e+05
   
>> moneyf(0.16)
ans =
   5.2484e+05
```

Thus, the root of equation $500,000=\frac{300}{I/12}((1+\frac{I}{12})^{240}-1)(1+\frac{I}{12})$  is within interval [0.15,0.16]. Use the False Position Method to find the solution of equation $f(x)=\frac{300}{I/12}((1+\frac{I}{12})^{240}-1)(1+\frac{I}{12})-500000=0$.

```matlab
%f.m
function [output] = f(x)
output=(300/(x/12))*((1+(x/12))^240-1)*(1+x/12)-500000;
end

%regula.m
function [n,c,yc] = regula(f,a,b,delta,epsilon,max1)
digits(10) 
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
    elseif yb*yc>0 
        b=c;
        yb=yc;
    else 
        a=c;
        ya=yc;
    end
    dx=min(abs(dx),ac);
    if abs(dx)<delta,break,end
    if abs(yc)<epsilon,break,end
end
n=k;
c=vpa(c);
yc=feval(f,c);

%Command line window
>> [n,c,yc] = regula(@f,0.15,0.16,1e-10,1e-10,100)
n =
     6

c =
    0.1566

yc =
  -1.6076e-05
```

Thus , we find an approximation (accurate to 10 decimal places) for the interest rate $I=0.1566= 15.66\%$ that will yield a total annuity value of $\$500,000$ if $240$ monthly payments of $\$300$ are made.



#### P39 7.

Consider the function $f(x)=xe^{-x}$.
**(a)** Find the Newton-Raphson formula $p_k=g(p_{k-1})$.
**(b)** If $p_0=0.2$, then find $p_1,p_2,p_3$ and $p_4$. What is $lim_{n\to\infty }p_k$ ?
**(c)** If $p_0=2.0$, then find $p_1,p_2,p_3$ and $p_4$. What is $lim_{n\to\infty }p_k$ ?
**(d)** What is the value of $f(p_4)$ in part (c) ?

**Solution:**
**(a)** The first derivate of $f(x)=xe^{-x}$ is $f'(x)=(1-x)e^{-x}$.
The Newton-Raphson iterative function is $g(x)=x-\frac{x}{1-x}=\frac{x^2}{x-1}$.
The Newton-Raphson formula is $p_k=\frac{p_{k-1}^2}{p_{k-1}-1},k=1,2,...$.

**(b)** 

```matlab
%f.m
function [output] = f(x)
output=x*exp(-x);
end

%df.m
function [output] = df(x)
syms k
f(k)=k*exp(-k);
df=diff(f(k));
k=x;
output=eval(df);
end

%newton.m
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
```

```matlab
%Command line window
>> [P,err,k,y] = newton(@f,@df,0.2,1e-12,1e-12,100)
```

The results are listed in table with starting value $p_0=0.2$.

| $k$  | $p_k$     | $f(p_k)$  |
| ---- | --------- | --------- |
| 0    | 0.200000  | 0.163746  |
| 1    | -0.050000 | -0.052563 |
| 2    | -0.002380 | -0.002387 |
| 3    | -0.000006 | -0.000006 |
| 4    | -0.000000 | -0.000000 |

Thus, the fixed point is $x=0$, $lim_{n\to\infty }p_k=0$.

**(c)-(d)** 

```matlab
%Command line window
>> [P,err,k,y] = newton(@f,@df,2,1e-12,1e-12,100)
```

The results are listed in table with starting value $p_0=2.0$.

| $k$  | $p_k$    | $f(p_k)$ |
| ---- | -------- | -------- |
| 0    | 2.000000 | 0.270671 |
| 1    | 4.000000 | 0.073263 |
| 2    | 5.333333 | 0.025749 |
| 3    | 6.564103 | 0.009256 |
| 4    | 7.743826 | 0.003356 |

$f(p_4)=7.743826$，this time $lim_{n\to\infty }p_k=+\infty$.