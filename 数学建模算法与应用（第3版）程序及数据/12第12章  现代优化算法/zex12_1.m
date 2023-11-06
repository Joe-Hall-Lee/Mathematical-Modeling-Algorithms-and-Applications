clc, clear
x = [0.23, 0.82, 0.45, 0.74, 0.87, 0.11, 0.56, 0.69, 0.78]
[sx, ind1] = sort(x) % 按照从小到大排列，ind1 为解码序列
ind2(ind1) = 1:length(ind1)