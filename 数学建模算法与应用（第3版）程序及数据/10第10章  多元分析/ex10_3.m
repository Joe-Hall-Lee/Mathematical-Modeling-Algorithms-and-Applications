clc, clear
B = [1, -2, 0; -2, 5, 0; 0, 0, 0.2];
[vec, val] = eig(B) % ����������������ֵ
val = diag(val) % �������ֵ
rate = val / sum(val) % ������