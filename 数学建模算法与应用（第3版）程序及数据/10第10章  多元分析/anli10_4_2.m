clc, clear, d = readmatrix('anli10_4.txt');
num = input('请选择主因子的个数：'); % 交互式选择主因子的个数
[lambda, psi, T, stats, F] = factoran(d, num, 'Rotate', 'varimax', 'Scores', 'regression') % Lambda 返回的是因子载荷矩阵，psi 返回的是特殊方差，T 返回的是旋转正交矩阵，stats 返回的是一些统计量，F 返回的是因子得分矩阵
gtd = 1 - psi % 计算共同度
contr = sum(lambda.^2) % 计算可解释方差