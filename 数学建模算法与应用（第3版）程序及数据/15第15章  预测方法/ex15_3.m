clc, clear
x0 = [41, 49, 61, 78, 96, 104]'; % ԭʼ���е�������
n = length(x0);
x1 = cumsum(x0) % ���� 1 ���ۼ�����
a_x0 = diff(x0) % ���� 1 ���ۼ�����
z = 0.5 * (x1(2:end) + x1(1:end-1)); % �����ֵ��������
B = [-x0(2:end), -z, ones(n-1, 1)];
u = B \ a_x0 % ��С���˷���ϲ���
syms x(t)
% ����Ž�
x = dsolve(diff(x, 2)+u(1)*diff(x)+u(2)*x == u(3), x(0) == x1(1), x(5) == x1(6));
xt = vpa(x, 6) % ��ʾС����ʽ�ķ��Ž�
yuce = subs(x, t, 0:n-1); % ����֪���ݵ� 1 ���ۼ����е�Ԥ��ֵ
yuce = double(yuce) % ������ת������ֵ���ͣ������޷����������
x0_hat = [yuce(1), diff(yuce)]; % ����֪���ݵ��Ԥ��ֵ
x0_hat = round(x0_hat) % ��������ȡ����
epsilon = x0 - x0_hat' % ��в�
delta = abs(epsilon./x0) % ��������