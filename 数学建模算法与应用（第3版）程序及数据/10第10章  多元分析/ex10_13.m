clc, clear
r = [1, -1 / 3, 2 / 3; -1 / 3, 1, 0; 2 / 3, 0, 1];
% 下面利用相关系数矩阵求主成分解，vec 的列为 r 的特征向量，即主成分的系数
[vec, val, rate] = pcacov(r) % val 为 r 的特征值，rate 为各个主成分的贡献率
a = vec .* sqrt(val') % 构造全部因子的载荷矩阵，见（10.27）式
num = 2; % 选择两个主因子
[aa, t] = rotatefactors(a(:, 1:num), 'Method', 'varimax') % 对载荷矩阵进行旋转，其中 aa 为旋转载荷矩阵，t 为变换的正交矩阵