% 程序文件 ex12_6.m——成对数据差异性的假设检验
clc, clear
a1 = readmatrix('data12_1.xlsx'); % 读入第一组红葡萄酒数据
mu1 = mean(a1); % 求每个第一组评酒员的均值
v1 = var(a1); % 求每个第一组评酒员的方差
r1 = range(a1); % 求每个第一组评酒员的极差
smu1 = mean(a1, 'all') % 求第一组的总均值
svar1 = var(a1, 0, 'all') % 求第一组的总方差
sr1 = range(a1, 'all') % 求第一组的总极差
a2 = readmatrix('data12_1.xlsx', 'Sheet', 2); % 读入第二组红葡萄酒数据
mu2 = mean(a2); % 求每个第二组评酒员的均值
v2 = var(a2); % 求每个第二组评酒员的方差
r2 = range(a2); % 求每个第二组评酒员的极差
smu2 = mean(a2, 'all') % 求第二组的总均值
svar2 = var(a2, 0, 'all') % 求第二组的总方差
sr2 = range(a2, 'all') % 求第二组的总极差
writematrix([mu1', v1', r1', mu2', v2', r2'], 'data12_2.xlsx')

X1 = mean(a1, 2) % 计算第一组红葡萄酒每个酒品的评分
Y1 = mean(a2, 2) % 计算第二组红葡萄酒每个酒品的评分
pd1 = fitdist(X1, 'Normal');
[h1, p1, st1, cv1] = kstest(X1, 'cdf', pd1)
pd2 = fitdist(Y1, 'Normal');
[h2, p2, st2, cv2] = kstest(Y1, 'cdf', pd2)

[h2, pd, ci3, st3] = ttest(X1, Y1)
ta = tinv(0.975, st3.df) % 求上 alpha / 2 分位数
db = mean(X1-Y1)
sd = std(X1-Y1)
stb = db / sd * sqrt(27)

a3 = readmatrix('data12_1.xlsx', 'Sheet', 3); % 读入第一组白葡萄酒数据
a4 = readmatrix('data12_1.xlsx', 'Sheet', 4); % 读入第二组白葡萄酒数据
X2 = mean(a3, 2);
Y2 = mean(a4, 2);
[h4, p4, ci4, st4] = ttest(X2, Y2)