clc, clear, close all
a = imread("司守奎.jpg")
rng(2) % 取确定的随机数种子，为了进行一致性比较
[m, n, k] = size(a);
r = rand(1, m);
[sr, ind1] = sort(r); % 生成用于打乱行的地址 ind1
c = rand(1, n);
[sr, ind2] = sort(c); % 生成用于打乱列的地址 ind2
b = a(ind1, ind2, :); % 生成加密矩阵 b
save zhaopian b
subplot(121), imshow(a)
subplot(122), imshow(b)