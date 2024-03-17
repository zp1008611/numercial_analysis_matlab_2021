function X = forsub(A,B)
%Input  -A��һ��n��n�������Ƿ��������
%       -B��һ��n��1�ľ���    
%Output -X�����Է�����AX=B�Ľ�
n=length(B);    %B��ά��
X=zeros(n,1);   %n��1�������
X(1)=B(1)/A(1,1);
for k=2:n
    X(k)=(B(k)-A(k,1:k)*X(1:k))/A(k,k);
end

