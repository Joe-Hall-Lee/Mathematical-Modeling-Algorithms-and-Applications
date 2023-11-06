clc, clear
x = readmatrix('anli10_6.xlsx'); % 读入表单 Sheet1 中的数据 x
y = readmatrix('anli10_6.xlsx', 'Sheet', 2); % 读入 Sheet2 中的数据 y
p = size(x, 2);
q = size(y, 2);
x = zscore(x);
y = zscore(y); % 标准化数据
n = size(x, 1); % 观测数据的个数
% 下面做典型相关分析，a1、b1返回的是典型变量的系数，r 返回的是典型相关系数
% u1、v1 返回的是典型变量的值，stats 返回的是假设检验的一些统计量的值
[a1, b1, r, u1, v1, stats] = canoncorr(x, y)
% 下面修正 a1、b1 每一列的正负号，使得 a、b 每一列的系数和为正
% 对应地，典型变量取值的正负号也要修正
a = a1 .* sign(sum(a1))
b = b1 .* sign(sum(b1))
u = u1 .* sign(sum(a1))
v = v1 .* sign(sum(b1))
x_u_r = x' * u / (n - 1) % 计算 x、u 的相关系数
y_v_r = y' * v / (n - 1) % 计算 y、v 的相关系数
x_v_r = x' * v / (n - 1) % 计算 x、v 的相关系数
y_u_r = y' * u / (n - 1) % 计算 y、u 的相关系数
ux = sum(x_u_r.^2) / p % x 组原始变量被 u_i 解释的方差比例
ux_cum = cumsum(ux) % x 组原始变量被 u_i 解释的方差累积比例
vx = sum(x_v_r.^2) / p % x 组原始变量被 v_i 解释的方差比例
vx_cum = cumsum(vx) % x 组原始变量被 v_i 解释的方差累积比例
vy = sum(y_v_r.^2) / q % y 组原始变量被 v_i 解释的方差比例
vy_cum = cumsum(vy) % y 组原始变量被 v_i 解释的方差累积比例
uy = sum(y_u_r.^2) / q % y 组原始变量被 u_i 解释的方差比例
uy_cum = cumsum(uy) % y 组原始变量被 u_i 解释的方差累积比例
val = r.^2 % 典型相关系数的平方，M1 或 M2 矩阵的非零特征值
