clc, clear, a = readmatrix('data4_22.xlsx');
a(isnan(a)) = 0; % 把 NaN 替换为 0
b = zeros(10); % 邻接矩阵初始化
b([1:end - 1], [2:end]) = a; % 邻接矩阵上三角元素赋值
b = b + b'; % 构造完整的邻接矩阵
n = 10;
b([1:n + 1:end]) = 1000000; % 对角线元素换为充分大
prob = optimproblem;
x = optimvar('x', n, n, 'Type', 'integer', 'LowerBound', 0, 'UpperBound', 1);
u = optimvar('u', n, 'LowerBound', 0); % 序号变量
prob.Objective = sum(sum(b.*x));
prob.Constraints.con1 = [sum(x, 2) == 1; sum(x, 1)' == 1; u(1) == 0];
con2 = [1 <= u(2:end); u(2:end) <= n - 1];
for i = 1:n
    for j = 2:n
        con2 = [con2; u(i) - u(j) + n * x(i, j) <= n - 1];
    end
end
prob.Constraints.con2 = con2;
[sol, fval, flag] = solve(prob)
xx = sol.x;
[i, j] = find(xx);
fprintf('xij = 1 对应的行列位置如下：\n')
ij = [i'; j']
