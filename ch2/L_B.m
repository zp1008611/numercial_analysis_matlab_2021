function [L,B] = L_B(dem)
%L_B �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
L=zeros(20,20);
B=zeros(20,1);
for i=1:dem
    for j=1:dem
        if i>=j
            L(i,j)=i+j;
        end
    end
end
for k=1:dem
    B(k)=k;
end
end

