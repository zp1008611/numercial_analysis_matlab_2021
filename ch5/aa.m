function S = aa(f,a,b)
%AA �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
syms x
ff=diff(f,x,4);
t=a:(b-a)/1000:b;
m=abs(ceil(max(subs(ff,t))));
syms K;
eqn=((b-a)^5*m)/(180*K)==1e-10;%K=M^4
S=ceil(solve(eqn));
end

