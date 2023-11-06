clc, clear
x = readmatrix('anli10_6.xlsx'); % ����� Sheet1 �е����� x
y = readmatrix('anli10_6.xlsx', 'Sheet', 2); % ���� Sheet2 �е����� y
p = size(x, 2);
q = size(y, 2);
x = zscore(x);
y = zscore(y); % ��׼������
n = size(x, 1); % �۲����ݵĸ���
% ������������ط�����a1��b1���ص��ǵ��ͱ�����ϵ����r ���ص��ǵ������ϵ��
% u1��v1 ���ص��ǵ��ͱ�����ֵ��stats ���ص��Ǽ�������һЩͳ������ֵ
[a1, b1, r, u1, v1, stats] = canoncorr(x, y)
% �������� a1��b1 ÿһ�е������ţ�ʹ�� a��b ÿһ�е�ϵ����Ϊ��
% ��Ӧ�أ����ͱ���ȡֵ��������ҲҪ����
a = a1 .* sign(sum(a1))
b = b1 .* sign(sum(b1))
u = u1 .* sign(sum(a1))
v = v1 .* sign(sum(b1))
x_u_r = x' * u / (n - 1) % ���� x��u �����ϵ��
y_v_r = y' * v / (n - 1) % ���� y��v �����ϵ��
x_v_r = x' * v / (n - 1) % ���� x��v �����ϵ��
y_u_r = y' * u / (n - 1) % ���� y��u �����ϵ��
ux = sum(x_u_r.^2) / p % x ��ԭʼ������ u_i ���͵ķ������
ux_cum = cumsum(ux) % x ��ԭʼ������ u_i ���͵ķ����ۻ�����
vx = sum(x_v_r.^2) / p % x ��ԭʼ������ v_i ���͵ķ������
vx_cum = cumsum(vx) % x ��ԭʼ������ v_i ���͵ķ����ۻ�����
vy = sum(y_v_r.^2) / q % y ��ԭʼ������ v_i ���͵ķ������
vy_cum = cumsum(vy) % y ��ԭʼ������ v_i ���͵ķ����ۻ�����
uy = sum(y_u_r.^2) / q % y ��ԭʼ������ u_i ���͵ķ������
uy_cum = cumsum(uy) % y ��ԭʼ������ u_i ���͵ķ����ۻ�����
val = r.^2 % �������ϵ����ƽ����M1 �� M2 ����ķ�������ֵ
