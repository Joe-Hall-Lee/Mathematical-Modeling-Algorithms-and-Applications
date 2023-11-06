clc, clear
r = [1, 0.02, 0.96, 0.42, 0.01; 0.02, 1, 0.13, 0.71, 0.85; 0.96, 0.13, 1, 0.5, 0.11; ...
    0.42, 0.71, 0.5, 1, 0.79; 0.01, 0.85, 0.11, 0.79, 1];
[vec, val, rate] = pcacov(r)
a = vec .* sqrt(val') % 计算全部因子的载荷矩阵，见（10.27）式
num = 2; % num 为因子的个数
a1 = a(:, [1:num]) % 提出两个因子的载荷矩阵
tcha = diag(r-a1*a1') % 因子的特殊方差
gtd1 = sum(a1.^2, 2) % 求因子载荷矩阵 a1 的共同度
con = cumsum(rate(1:num)) % 求累积贡献率
[B, T] = rotatefactors(a1, 'Method', 'varimax') % B 为旋转因子载荷矩阵，T 为正交矩阵
gtd2 = sum(B.^2, 2) % 求因子载荷矩阵 B 的共同度
w = [sum(a1.^2), sum(B.^2)] % 分别计算两个因子载荷矩阵对应的方差贡献