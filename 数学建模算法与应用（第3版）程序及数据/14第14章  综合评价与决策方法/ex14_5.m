clc, clear, m = 3;
n = 10;
s = 2;
d = load('data14_5.txt');
a = d(:, [1:3]);
b = d(:, [4, 5]);
prob = optimproblem('ObjectiveSense', 'max');
u = optimvar('u', m, 'LowerBound', 0);
v = optimvar('v', s, 'LowerBound', 0); % ������
prob.Constraints.con1 = a * u >= b * v;
for j = 1:n
    fprintf('�� %d ����������£�\n', j+1989)
    prob.Objective = b(j, :) * v;
    prob.Constraints.con2 = a(j, :) * u == 1;
    [sol, fval] = solve(prob)
    su = sol.u, sv = sol.v % ��ʾ���Ž�
end