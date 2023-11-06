clc, clear
a = readmatrix('anli10_1.txt');
b = zscore(a); % 数据标准化
r = corrcoef(b); % 计算相关系数矩阵
% 下面直接使用标准化数据进行主成分分析，vec 为 r 的特征向量，即主成分的系数
[vec, score, lambda] = pca(b) % score 为主成分的得分，lambda 为 r 的特征值
rate = lambda / sum(lambda) % 计算各个主成分的贡献率
contr = cumsum(rate) % 计算累积贡献率
num = 4; % num 为选取的主成分的个数
df = score(:, 1:num); % 提出各个主成分的得分
tf = df * rate(1:num); % 计算综合得分
[stf, ind] = sort(tf, 'descend'); % 把得分按照从高到低的次序排列
stf = stf', ind = ind'