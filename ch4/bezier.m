function B = bezier(i,N,t)
%BEZIER 此处显示有关此函数的摘要
%   此处显示详细说明
B=(factorial(N)/(factorial(i)*factorial(N-i)))*(t.^(i)).*((1-t).^(N-i));
end

