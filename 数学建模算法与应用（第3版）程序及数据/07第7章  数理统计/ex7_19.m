clc, clear, close all
a = readmatrix('data7_19.txt')' % 注意矩阵转置
[p, t, st] = anova1(a)
Fa = finv(0.95, t{2, 3}, t{3, 3}) % 计算 F 分布的上 alpha 分位数