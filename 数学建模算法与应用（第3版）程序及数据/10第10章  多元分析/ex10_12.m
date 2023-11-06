clc, clear
r = [1, 1 / 5, -1 / 5; 1 / 5, 1, -2 / 5; -1 / 5, -2 / 5, 1];
[Lambda, Psi] = factoran(r, 1, 'Xtype', 'cov') % Lambda 返回的是因子载荷矩阵，Psi 返回的是特殊方差