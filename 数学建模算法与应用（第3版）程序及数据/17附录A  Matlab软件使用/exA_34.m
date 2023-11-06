clc, clear, f = fopen('dataA_34_1.txt');
d0 = textscan(f, '%s');
d = d0{1};
for i = 1:length(d)
    a = sum(d{i} == 97);
    c = sum(d{i} == 99);
    g = sum(d{i} == 103);
    t = sum(d{i} == 116);
    n = sum(d{i} >= 97 & d{i} <= 122); % 检验 26 个小写字符的个数
    s(i, :) = [a, c, g, t, n, a + c + g + t];
end
s, he = sum(s)
writematrix(s, 'dataA_34_2.txt')