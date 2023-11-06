clc, clear
x0 = [4.93, 2.33, 3.87, 4.35, 6.63, 7.15, 5.37, 6.39, 7.81, 8.35]';
x1 = cumsum(x0); % �� 1 ���ۼ�����
n = length(x0);
z = 0.5 * (x1(2:n) + x1(1:n-1)); % �� x1 �ľ�ֵ��������
B = [-z, z.^2];
Y = x0(2:end);
u = B \ Y %���Ʋ��� a��b ��ֵ
syms x(t)
x = dsolve(diff(x)+u(1)*x == u(2)*x^2, x(0) == x0(1)); % ����Ž�
xt = vpa(x, 6) % ��ʾС����ʽ�ķ��Ž�
yuce = subs(x, t, [0:n - 1]); % ����֪���ݵ� 1 ���ۼ����е�Ԥ��ֵ
yuce = double(yuce) % ������ת������ֵ���ͣ������޷����������
x0_hat = [yuce(1), diff(yuce)]' % ����֪���ݵ��Ԥ��ֵ
epsilon = x0 - x0_hat % ��в�
delta = abs(epsilon./x0) % ��������
writematrix([x0, x0_hat, epsilon, delta], 'data15_5.xlsx')