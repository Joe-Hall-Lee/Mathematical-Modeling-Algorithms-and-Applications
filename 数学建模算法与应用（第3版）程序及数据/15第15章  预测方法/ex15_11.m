clc, clear, syms x y
syms z positive % 由于导弹在空中，定义符号变量 z 为正
format long g % 长小数的数据显示格式
a = load('data15_11.txt'); % 全部数据保存到文本文件 data15_11.txt 中
d = a(:, [2:end]); % 提取 3 个测距仪到观测点的距离，a 的第一列为时间
n = size(a, 1);
sol = []; % sol 为保存观测点坐标的矩阵，这里初始化
for i = 1:n
    eq1 = x^2 + y^2 + z^2 - d(i, 1)^2; % 定义非线性方程组的符号方程左端项
    eq2 = x^2 + (y - 4500)^2 + z^2 - d(i, 2)^2;
    eq3 = (x + 2000)^2 + (y - 1500)^2 + z^2 - d(i, 3)^2;
    [xx, yy, zz] = solve(eq1, eq2, eq3); % 求 x、y、z 的符号解。
    sol = [sol; double([xx, yy, zz])]; % 数据类型转换，符号数据无法直接插值
end
sol % 显示求得的 10 个点的坐标
pp1 = csape(a(:, 1), sol(:, 1)) % 求 x(t) 的插值函数
xishu1 = pp1.coefs(end, :) % 显示 x(t) 最后一个区间的三次样条函数的系数
pp2 = csape(a(:, 1), sol(:, 2)) % 求 y(t) 的插值函数
xishu2 = pp2.coefs(end, :) % 显示 y(t) 最后一个区间的三次样条函数的系数
pp3 = csape(a(:, 1), sol(:, 3)) %求 z(t) 的插值函数
xishu3 = pp3.coefs(end, :) % 显示 z(t) 最后一个区间的三次样条函数的系数