clc, clear
x0 = [1:6]';
y0 = [16, 18, 21, 17, 15, 12]';
x = [1.5, 2.6];
yh = lagrange(x0, y0, x) % 求估计值