clc, clear
aw = load('data14_8_1.txt');
w = aw(end, :); % ��ȡȨ������
a = aw([1:end - 1], :); % ��ȡָ������
a(:, [2, 6]) = -a(:, [2, 6]); % �ѳɱ���ָ��ת����Ч����ָ��
ra = tiedrank(a) % ��ÿ��ָ��ֵ�ֱ���ȣ����� a ��ÿһ�зֱ����
[n, m] = size(ra); % ������� ra ��ά��
WRSR = sum(ra.*w, 2) / n % �����Ȩ�Ⱥͱ�
[sWRSR, ind] = sort(WRSR, 'descend') % �Լ�Ȩ�Ⱥͱ�����
writematrix([ra, WRSR], 'data14_8_2.xlsx')