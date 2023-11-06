% 程序文件 ex12_5——数据的正态分布检验
clc, clear
a1 = readmatrix('data12_1.xlsx'); % 读入第一组红葡萄酒数据
n1 = size(a1, 1); % 读入矩阵 a1 的行数
for i = 1:n1
    pd = fitdist(a1(i, :)', 'Normal');
    [h1(i), p1(i), st1(i), cv1(i)] = kstest(a1(i, :), 'cdf', pd);
end
h1 % 显示检验结果
a2 = readmatrix('data12_1.xlsx', 'Sheet', 2); % 读入第二组红葡萄酒数据
n2 = size(a2, 1); % 读入矩阵 a2 的行数
for i = 1:n2
    pd = fitdist(a2(i, :)', 'Normal');
    [h2(i), p2(i), st2(i), cv2(i)] = kstest(a2(i, :), 'cdf', pd);
end
h2 % 显示检验结果
a3 = readmatrix('data12_1.xlsx', 'Sheet', 3); % 读入第一组白葡萄酒数据
n3 = size(a3, 1); % 读入矩阵 a3 的行数
for i = 1:n3
    pd = fitdist(a3(i, :)', 'Normal');
    [h3(i), p3(i), st3(i), cv3(i)] = kstest(a3(i, :), 'cdf', pd);
end
h3 % 显示检验结果
a4 = readmatrix('data12_1.xlsx', 'Sheet', 4); % 读入第二组白葡萄酒数据
n4 = size(a4, 1); % 读入矩阵 a4 的行数
for i = 1:n4
    pd = fitdist(a4(i, :)', 'Normal');
    [h4(i), p4(i), st4(i), cv4(i)] = kstest(a4(i, :), 'CDF', pd);
end
h4 % 显示检验结果