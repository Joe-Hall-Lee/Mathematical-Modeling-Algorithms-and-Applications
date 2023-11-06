clc, clear, close all
a = readmatrix('data7_22.txt')
Y = [a(:, 2); a([1:end - 1], 7)]; % 提取 y 的数据
X = [a(:, [3:5]); a([1:end - 1], [8:10])];
c = regstats(Y, X) % 多元线性回归诊断
beta = c.beta % 提出回归系数
F = c.fstat % 提出 F 统计量的多个相关指标
m = 3;
n = length(Y); % 变量个数 m，样本点个数 n
Fa = finv(0.95, m, n-m-1) % 计算上 alpha 分位数
T = c.tstat.t % 提出 4 个 t 统计量的值
Ta = tinv(0.975, n-m-1) % 计算上 alpha / 2 分位数
X23 = X(:, [2, 3]); % 去掉不显著变量 x1 的数据
nc = regstats(Y, X23) % 重新计算模型
beta2 = nc.beta % 提出新的回归系数
rstool(X, Y) % 使用图形界面解法求二次式回归模型