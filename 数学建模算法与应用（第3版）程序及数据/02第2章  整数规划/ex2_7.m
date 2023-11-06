clc, clear, a = load('data2_7.txt');
d = dist(a) % 求两两列向量之间的距离
n = 10;
prob = optimproblem;
x = optimvar('x', n, 'Type', 'integer', 'LowerBound', 0, 'UpperBound', 1)
y = optimvar('y', n, n, 'Type', 'integer', 'LowerBound', 0, 'UpperBound', 1);
prob.Objective = sum(x);
con1 = [1 <= sum(y)'; sum(y, 2) <= 5];
con2 = [];
for i = 1:n
    con2 = [con2; x(i) == y(i, i)];
    for j = 1:n
        con1 = [con1; d(i, j) * y(i, j) <= 10 * x(i); y(i, j) <= x(i)];
    end
end
prob.Constraints.con1 = con1;
prob.Constraints.con2 = con2;
[sol, fval, flag] = solve(prob)
xx = sol.x, yy = sol.y