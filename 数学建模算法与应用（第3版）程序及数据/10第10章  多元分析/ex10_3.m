clc, clear
B = [1, -2, 0; -2, 5, 0; 0, 0, 0.2];
[vec, val] = eig(B) % 求特征向量和特征值
val = diag(val) % 提出特征值
rate = val / sum(val) % 求贡献率