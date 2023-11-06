clc, clear
a = [15.2, 15.9, 18.7, 22.4, 26.9, 28.3, 30.5, ...
    33.8, 40.4, 50.7, 58, 66.7, 81.2, 83.4];
Rt = tiedrank(a) % ��ԭʼʱ�����е���
n = length(a);
t = 1:n;
Qs = 1 - 6 / (n * (n^2 - 1)) * sum((t - Rt).^2) % ���� Qs ��ֵ
T = Qs * sqrt(n-2) / sqrt(1-Qs^2) % ���� T ͳ������ֵ
t_0 = tinv(0.975, n-2) % ������ alpha / 2 ��λ��
b = diff(a); % ��ԭʼʱ�����е�һ�ײ��
m = ar(b, 2, 'ls') % ������С���˷�����ģ�͵Ĳ���
bhat = predict(m, b') % ��Ԥ��ֵ,�ڶ�����������Ϊ������
bhat(end+1) = forecast(m, b', 1) % ���� 1 ��Ԥ��ֵ���ڶ�����������Ϊ������
ahat = [a(1), a + bhat'] % ��ԭʼ���ݵ�Ԥ��ֵ�������� t = 15 ��Ԥ��ֵ
delta = abs((ahat(1:end-1) - a)./a) % ����ԭʼ����Ԥ���������
writematrix(ahat, 'anli15_1.xlsx')
writematrix(delta, 'anli15_1.xlsx', 'Sheet', 1, 'Range', 'A3')