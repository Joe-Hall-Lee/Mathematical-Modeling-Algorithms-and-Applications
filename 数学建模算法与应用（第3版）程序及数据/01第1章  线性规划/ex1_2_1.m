clc, clear
c = [4; 3];
b = [10; 8; 7];
a = [2, 1; 1, 1; 0, 1];
lb = zeros(2, 1);
[x, fval] = linprog(-c, a, b, [], [], lb) % û�еȺ�Լ��
y = -fval % Ŀ�꺯��Ϊ���