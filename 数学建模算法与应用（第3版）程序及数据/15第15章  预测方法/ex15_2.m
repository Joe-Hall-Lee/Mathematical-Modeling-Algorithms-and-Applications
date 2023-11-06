clc, clear
x0 = [71.1, 72.4, 72.4, 72.1, 71.4, 72.0, 71.6]'; % ע������Ϊ������
n = length(x0);
lamda = x0(1:n-1) ./ x0(2:n) % ���㼶��
range = minmax(lamda') % ���㼶�ȵķ�Χ
x1 = cumsum(x0) % �ۼ�����
B = [-0.5 * (x1(1:n-1) + x1(2:n)), ones(n-1, 1)];
Y = x0(2:n);
u = B \ Y % ��ϲ��� u(1) = a, u(2) = b
syms x(t)
x = dsolve(diff(x)+u(1)*x == u(2), x(0) == x0(1)); % ��΢�ַ��̵ķ��Ž�
xt = vpa(x, 6) % ��С����ʽ��ʾ΢�ַ��̵Ľ�
yuce1 = subs(x, t, [0:n - 1]); % ����֪���ݵ�Ԥ��ֵ
yuce1 = double(yuce1); % ������ת������ֵ���ͣ�����������
yuce = [x0(1), diff(yuce1)] % ������㣬��ԭ����
epsilon = x0' - yuce % ����в�
delta = abs(epsilon./x0') % ����������
rho = 1 - (1 - 0.5 * u(1)) / (1 + 0.5 * u(1)) * lamda' % ���㼶��ƫ��ֵ��u(1) = a