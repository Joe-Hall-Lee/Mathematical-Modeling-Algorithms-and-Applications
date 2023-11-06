clc, clear, close all
load zhaopian.mat
rng(2) % 取确定的随机数种子，为了进行一致性比较
[m, n, k] = size(b);
r = rand(1, m);
[sr, ind1] = sort(r); % 生成用于打乱行的地址 ind1
c = rand(1, n);
[sc, ind2] = sort(c); % 生成用于打乱列的地址 ind2
eb(ind1, ind2, :) = b; % 生成揭秘矩阵 eb
imshow(eb)