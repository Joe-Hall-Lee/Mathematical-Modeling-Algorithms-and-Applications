clc, clear
d = load('data3_9.txt');
a = d(1, :);
b = d(2, :);
c = d(3, :);
p = optimproblem;
x = optimvar('x', 2, 'LowerBound', 0);
y = optimvar('y', 2, 'LowerBound', 0);
z = optimvar('z', 6, 2, 'LowerBound', 0);

% 利用矩阵广播定义目标函数的匿名函数
f = @(x, y, z)sum(sum(z'.*sqrt((a - x).^2+(b - y).^2)));
p.Objective = fcn2optimexpr(f, x, y, z);
p.Constraints.c1 = sum(z, 2) == c';
p.Constraints.c2 = sum(z) <= 20;
x0.x = rand(2, 1);
x0.y = rand(2, 1);
x0.z = rand(6, 2);
opt = optimoptions('fmincon', 'Algorithm', 'sqp');
[s, f, flag] = solve(p, x0, 'Options', opt)
xx = s.x, yy = s.y, zz = s.z