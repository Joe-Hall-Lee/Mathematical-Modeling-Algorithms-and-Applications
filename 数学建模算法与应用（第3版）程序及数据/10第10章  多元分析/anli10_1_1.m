clc, clear, close all
a = readmatrix('anli10_1.txt');
b = zscore(a); % 数据标准化
r = corrcoef(b) % 计算相关系数矩阵
d = tril(1-r);
% d = nonzeros(d)'; % 另外一种计算距离方法
z = linkage(b', 'average', 'correlation'); % 按类平均法聚类
h = dendrogram(z); % 画聚类图
set(h, 'Color', 'k', 'LineWidth', 1.3) % 把聚类图线的颜色改成黑色，线宽加粗
T = cluster(z, 'maxclust', 6) % 把变量划分成 6 类
for i = 1:6
    tm = find(T == i); % 求第 i 类的对象
    fprintf('第 %d 类的有 %s \n', i, int2str(tm')); % 显示分类结果
end