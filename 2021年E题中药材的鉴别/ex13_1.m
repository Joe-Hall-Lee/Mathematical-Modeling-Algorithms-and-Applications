clc, clear, close all
d = readmatrix('附件1.xlsx', 'Range', 'B1:DXU426');
x = d(1,:); % 提出波段行向量数据
y = d(2:end, :); % 提出吸光度数据
plot(x', y'), xlabel('波数（cm^{-1}）');
ylabel('吸光度（AU）')
y1 = y(:, 1); [sy1, ind] = sort(y1, 'descend');
ind1 = ind(1:3) % 吸光度最大的 3 种药材编号
ind2 = setdiff([1:425], ind1); % 其余药材的编号
y2 = y(ind2, :); % 提取其余药材的吸光度数据
eva = evalclusters(y2, 'kmeans', 'DaviesBouldin', ...
    'KList',[2:10]); % 确定最佳聚类数
k = eva.OptimalK % 提出最佳聚类种数
% 返回值 idx 是聚类编号，C 为每个簇的中心（均指向量）
% sumd 为簇内的点到质心距离的总和，D 为每个点到每个质心的距离
[idx, C, sumd, D] = kmeans(y2, k);
ind3 = find(idx == 1); ind4 = find(idx == 2);
ind41 = ind2(ind3); ind42 = ind2(ind4);
n1 = length(ind41), n2 = length(ind42)
y123 = y(ind1, :); m123 = mean(y123, 2)
v123=var(y123, 0, 2)
y4 = y(ind41, :); y5 = y(ind42, :);
m4 = mean(y4, 'all'), v4 = var(y4, 0, 'all')
m5 = mean(y5, 'all'), v5 = var(y5, 0, 'all')
figure, plot(x, y4'), xlabel('波数（c,^{-1}');
ylabel('吸光度（AU）')
figure, plot(x, y5'), xlabel('波数（c,^{-1}');
ylabel('吸光度（AU）')