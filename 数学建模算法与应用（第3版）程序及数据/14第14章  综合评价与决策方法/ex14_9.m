clc, clear
a = readmatrix('data14_9_1.txt');
[n, m] = size(a);
p = a ./ sum(a);
e = -sum(p.*log(p)) / log(n);
g = 1 - e; w = g / sum(g) % 计算权重
s = w * p' % 计算各个评价对象的综合评价值
[ss, ind1] = sort(s, 'descend') % 对评价值从大到小排序
ind2(ind1) = 1:n % 学生编号对应的排序位置
writematrix(w, 'data14_9_2.xlsx') % 把数据写到 Excel 文件的表单 1
writematrix([1:n; s; ind2], 'data14_9_2.xlsx', 'Sheet', 2) % 把数据写到表单 2