clc, clear
prob = optimproblem('ObjectiveSense', 'max') % Ŀ�꺯����󻯵��Ż�����
c = [4; 3];
b = [10; 8; 7];
a = [2, 1; 1, 1; 0, 1];
x = optimvar('x', 2, 'LowerBound', 0); % ���߱���
prob.Objective = c' * x; % Ŀ�꺯��
prob.Constraints.con = a * x <= b; % Լ������
[sol, fval, flag, out] = solve(prob) % fval ��������ֵ
sol.x % ��ʾ���߱�����ֵ