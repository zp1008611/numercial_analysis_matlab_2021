function X = backsub(A,B)
%Input  -A��һ��n��n�������Ƿ��������
%       -B��һ��n��1�ľ���    
%Output -X�����Է�����AX=B�Ľ�
n=length(B);    %B��ά��
X=zeros(n,1);   %n��1�������
X(n)=B(n)/A(n,n);
for k=n-1:-1:1
    X(k)=(B(k)-A(k,k+1:n)*X(k+1:n))/A(k,k);
end

