clc, clear, close all
a = readmatrix('data7_5_1.txt');
a = a(~isnan(a)); % 去掉 NaN 值
pd = fitdist(a, 'Normal'), qqplot(a, pd) % MATLAB 工具箱直接画 Q-Q 图
sa = sort(a); % 把 a 按照从小到大排列
n = length(a);
pi = ([1:n] - 1 / 2) / n;
yi = norminv(pi, pd.mu, pd.sigma)'; % 计算对应的 yi 值
hold on, plot(yi,sa,'o') % 再重新描点画 Q-Q 图