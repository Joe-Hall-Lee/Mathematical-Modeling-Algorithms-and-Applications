clc, clear
a = [0.1, 5, 5000, 4.7; ...
    0.2, 6, 6000, 5.6; ...
    0.4, 7, 7000, 6.7; ...
    0.9, 10, 10000, 2.3; ...
    1.2, 2, 400, 1.8];
[m, n] = size(a);
x2 = @(qujian, lb, ub, x)(1 - (qujian(1) - x) ./ (qujian(1) - lb)) .* ...
    (x >= lb & x < qujian(1)) + (x >= qujian(1) & x <= qujian(2)) + ...
    (1 - (x - qujian(2)) ./ (ub - qujian(2))) .* (x > qujian(2) & x <= ub);
qujian = [5, 6];
lb = 2;
ub = 12;
a(:, 2) = x2(qujian, lb, ub, a(:, 2)); %对属性2进行变换
b = a ./ vecnorm(a) % 利用矩阵广播进行向量规范化
w = [0.2, 0.3, 0.4, 0.1];
c = b .* w; % 利用矩阵广播求加权矩阵
Cstar = max(c); % 求正理想解
Cstar(4) = min(c(:, 4)) % 属性 4 为成本型的
C0 = min(c); % 求负理想解
C0(4) = max(c(:, 4)) % 属性 4 为成本型的
Sstar = vecnorm(c-Cstar, 2, 2) % 逐行计算 2 范数即到正理想解的距离
S0 = vecnorm(c-C0, 2, 2) % 逐行计算 2 范数即到负理想解的距离
f = S0 ./ (Sstar + S0)
[sf, ind] = sort(f, 'descend') % 求排序结果