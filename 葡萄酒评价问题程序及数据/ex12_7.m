% 程序文件 ex12_7.m——方差分析计算
clc, clear, close all
a1 = readmatrix('data12_1.xlsx'); % 读入第一组红葡萄酒数据
[p1, tb1, st1] = anova2(a1)
a2 = readmatrix('data12_1.xlsx', 'Sheet', 2); % 读入第二组红葡萄酒数据
[p2, tb2, st2] = anova2(a2)
a3 = readmatrix('data12_1.xlsx', 'Sheet', 3); % 读入第一组红葡萄酒数据
[p3, tb3, st3] = anova2(a3)
a4 = readmatrix('data12_1.xlsx', 'Sheet', 4); % 读入第二组红葡萄酒数据
[p4, tb4, st4] = anova2(a4)