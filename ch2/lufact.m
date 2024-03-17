function [P,X,L,U] = lufact(A,B)
%Input  - A is an N��N matrix
%       - B is an N��1 matrix
%Output - X is an N��1 matrix containing the solution to AX=B.
%   �˴���ʾ��ϸ˵��
[N,N]=size(A);
X=zeros(N,1);
Y=zeros(N,1);
C=zeros(1,N);
R=1:N;  %���������
for p=1:N-1 %p�ǵڼ���
    %����Ԫ
    [max1,j]=max(abs(A(p:N,p)));
    %j:���ѵ�p�е��ɵ�һ��ʱ�����ֵ����������ڵ�һ�����ڵĵ�j��
    %max1:���ֵ
    %������
    C=A(p,:);
    A(p,:)=A(j+p-1,:);
    A(j+p-1,:)=C;
    %��¼�任
    d=R(p);
    R(p)=R(j+p-1);
    R(j+p-1)=d;
    if A(p,p)==0
        'A is singular.No unique solution'
        break
    end
    %��˹��ȥ����ȥ��p�е�p���µ�Ԫ�غ󣬵�p��p+1�е�N�еı仯
    for k=p+1:N
        mult=A(k,p)/A(p,p);
        A(k,p)=mult;
        A(k,p+1:N)=A(k,p+1:N)-mult*A(p,p+1:N);
    end
end
L=tril(ones(N));%��λ�����Ǿ���
for k=2:N
    L(k,1:k-1)=A(k,1:k-1);
end
U=triu(ones(N));
for k=1:N
    U(k,k:N)=A(k,k:N);
end
%LY=B��L�������Ǿ���,��Y
Y(1)=B(R(1));%��Ϊ������Ԫ��Aǰ����˳��Ⱦ���p����������BҲҪ���ű�.
for k=2:N
    Y(k)=B(R(k))-A(k,1:k-1)*Y(1:k-1);
end
%UX=Y��U�������Ǿ�����X
X(N)=Y(N)/A(N,N);
for k=N-1:-1:1
    X(k)=(Y(k)-A(k,k+1:N)*X(k+1:N))/A(k,k);
end
P=zeros(N,N);
for i=1:N
    P(R(i),i)=1;
end
P=inv(P);
X;
L;
U;
end

