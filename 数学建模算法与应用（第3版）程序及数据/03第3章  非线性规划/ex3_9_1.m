clc, clear, d0 = load('data3_9.txt');
prob = optimproblem;
x = optimvar('x', 2, 'LowerBound', 0);
y = optimvar('y', 2, 'LowerBound', 0);
z = optimvar('z', 6, 2, 'LowerBound', 0);
a = d0(1, :);
b = d0(2, :);
c = d0(3, :);
prob.Objective = fcn2optimexpr(@fun3_9, x, y, z, a, b);
prob.Constraints.con1 = sum(z, 2) == c';
prob.Constraints.con2 = sum(z) <= 20;
x0.x = 100 * rand(2, 1);
x0.y = 100 * rand(2, 1);
x0.z = 100 * rand(6, 2);
opt = optimoptions('fmincon', 'Algorithm', 'sqp');
[sol, fval, flag, output] = solve(prob, x0, 'Options', opt)
xx = sol.x, yy = sol.y, zz = sol.z % 显示决策向量的值

function obj = fun3_9(x, y, z, a, b);
obj = 0;
for i = 1:6
    for j = 1:2
        obj = obj + z(i, j) * sqrt((x(j) - a(i))^2+(y(j) - b(i))^2);
    end
end
end