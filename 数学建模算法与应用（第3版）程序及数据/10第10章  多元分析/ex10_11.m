clc, clear
r = [1, 1 / 5, -1 / 5; 1 / 5, 1, -2 / 5; -1 / 5, -2 / 5, 1];
n = size(r, 1);
rt = abs(r); % 求矩阵 r 所有元素的绝对值
rt(1:n+1:n^2) = 0; % 把 rt 矩阵的对角线元素换成 0
rstar = r; % R* 初始化
rstar(1:n+1:n^2) = max(rt'); %把矩阵 rstar 的对角线元素换成 rt 矩阵各行的最大值
% 下面利用 R* 矩阵求主因子解，vec 的列为矩阵 rstar 的特征向量
[vec, val, rate] = pcacov(rstar) % val 为 rstar 的特征值，rate 为各个主成分的贡献率
a = vec .* sqrt(val') % 计算因子载荷矩阵
num = input('请选择公共因子的个数：'); % 交互式选取主因子的个数
aa = a(:, 1:num) % 提出 num 个因子的载荷矩阵
s1 = sum(aa.^2) % 计算对 X 的贡献
s2 = sum(aa.^2, 2) % 计算共同度