clc, clear
prob = optimproblem('ObjectiveSense', 'max') % 目标函数最大化的优化问题
c = [4; 3];
b = [10; 8; 7];
a = [2, 1; 1, 1; 0, 1];
x = optimvar('x', 2, 'LowerBound', 0); % 决策变量
prob.Objective = c' * x; % 目标函数
prob.Constraints.con = a * x <= b; % 约束条件
[sol, fval, flag, out] = solve(prob) % fval 返回最优值
sol.x % 显示决策变量的值