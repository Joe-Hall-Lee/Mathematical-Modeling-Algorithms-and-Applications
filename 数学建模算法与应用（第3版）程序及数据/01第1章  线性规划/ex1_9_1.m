clc, clear, close all
prob = optimproblem('ObjectiveSense', 'max');
x = optimvar('x', 5, 1, 'LowerBound', 0);
c = [0.05, 0.27, 0.19, 0.185, 0.185]; % ��������
Aeq = [1, 1.01, 1.02, 1.045, 1.065]; % �Ⱥ�Լ������
prob.Objective = c * x;
M = 10000;
prob.Constraints.con1 = Aeq * x == M; % �Ⱥ�Լ������
q = [0.025, 0.015, 0.055, 0.026]'; % ������ʧ��
a = 0;
aa = [];
QQ = [];
XX = [];
hold on
while a < 0.05
    prob.Constraints.con2 = q .* x(2:end) <= a * M;
    [sol, Q, flag, out] = solve(prob);
    aa = [aa; a];
    QQ = [QQ, Q];
    XX = [XX; sol.x'];
    a = a + 0.001;
end
plot(aa, QQ, '*k')
xlabel('$a$', 'Interpreter', 'Latex'),
ylabel('$Q$', 'Interpreter', 'Latex', 'Rotation', 0)