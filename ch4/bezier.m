function B = bezier(i,N,t)
%BEZIER �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
B=(factorial(N)/(factorial(i)*factorial(N-i)))*(t.^(i)).*((1-t).^(N-i));
end

