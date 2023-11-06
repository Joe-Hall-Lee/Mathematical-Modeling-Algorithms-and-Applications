clc, clear
a = [8, 1, 7, 4, 8; ...
    10, 9, 8, 7, 1; ...
    7, 10, 8, 2, 3];
rng(1) % 取确定的随机数种子，为了进行一致性比较
[m, n] = size(a);
r = rand(1, m);
[sr, ind1] = sort(r); % 生成用于打乱行的地址 ind1
c = rand(1, n);
[sc, ind2] = sort(c); % 生成用于打乱列的地址 ind2
b = a(ind1, ind2) % 生成加密矩阵 b
ea(ind1, ind2) = b % 解码得到原来的矩阵 a