function [U,B] = U_B(dem)
%MATRIX_DEMO �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
U=zeros(dem,dem);
for i=1:dem
    for j=1:dem
        if i<=j
            U(i,j)=cos(i*j);
        end
    end
end
B=zeros(dem,1);
for k=1:dem
    B(k)=tan(k);
end
U;
B;
end

