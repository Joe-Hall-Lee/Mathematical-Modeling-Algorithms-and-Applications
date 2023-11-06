clc, clear
aw = load('data14_8_1.txt');
w = aw(end, :); % 提取权重向量
a = aw([1:end - 1], :); % 提取指标数据
a(:, [2, 6]) = -a(:, [2, 6]); % 把成本型指标转换成效益型指标
ra = tiedrank(a) % 对每个指标值分别编秩，即对 a 的每一列分别编秩
[n, m] = size(ra); % 计算矩阵 ra 的维数
WRSR = sum(ra.*w, 2) / n % 计算加权秩和比
[sWRSR, ind] = sort(WRSR, 'descend') % 对加权秩和比排序
writematrix([ra, WRSR], 'data14_8_2.xlsx')