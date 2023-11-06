clc, clear, close all, format long g
a = readmatrix('data10_17_1.txt');
T = sum(sum(a));
P = a / T; % 计算对应矩阵 P
r = sum(P, 2), c = sum(P) % 计算边缘分布
R = a ./ sum(a, 2) % 计算行轮廓分布阵
% B = diag(1./sqrt(r)) * (P - r * c) * diag(1./sqrt(c));
B = (P - r * c) ./ sqrt((r * c)); % 计算标准化数据 B
[u, s, v] = svd(B, 'econ') % 对标准化后的数据阵 B 作奇异值分解
lamda = diag(s).^2 % 计算 B' * B 的特征值，即计算惯量
ksi = T * (lamda) % 计算卡方统计量的分解
T_ksi = sum(ksi) % 计算总卡方统计量
con_rate = lamda / sum(lamda) % 计算贡献率
cum_rate = cumsum(con_rate) % 计算累积贡献率
beta = diag(r.^(-1 / 2)) * u; % 求加权特征向量
G = beta * s % 求行轮廓坐标
alpha = diag(c.^(-1 / 2)) * v; % 求加权特征向量
F = alpha * s % 求列轮廓坐标 F
num = size(G, 1);
rang = minmax(G(:, 1)'); % 坐标的取值范围
delta = (rang(2) - rang(1)) / (8 * num); % 画图的标注位置调整量
ch = 'LPSBEM'; hold on
for i = 1:num
    plot(G(i, 1), G(i, 2), '*', 'Color', 'k', 'LineWidth', 1.3) % 画行点散布图
    text(G(i, 1)+delta, G(i, 2), ch(i)) %对行点进行标注
    plot(F(i, 1), F(i, 2), 'H', 'Color', 'k', 'LineWidth', 1.3) % 画列点散布图
    text(F(i, 1)+delta, F(i, 2), int2str(i+1972)) % 对列点进行标注
end
xlabel('dim1'), ylabel('dim2'), format
writematrix([diag(s), lamda, ksi, con_rate, cum_rate], 'data10_17_2.xlsx')
warning("off"), writematrix(R, "data10_17_2.xlsx", "Sheet", 2)
writematrix([G(:, 1:2)'; F(:, 1:2)'], "test.xlsx")