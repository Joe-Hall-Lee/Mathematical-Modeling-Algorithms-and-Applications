clc, clear, d = readmatrix('anli10_4.txt');
num = input('��ѡ�������ӵĸ�����'); % ����ʽѡ�������ӵĸ���
[lambda, psi, T, stats, F] = factoran(d, num, 'Rotate', 'varimax', 'Scores', 'regression') % Lambda ���ص��������غɾ���psi ���ص������ⷽ�T ���ص�����ת��������stats ���ص���һЩͳ������F ���ص������ӵ÷־���
gtd = 1 - psi % ���㹲ͬ��
contr = sum(lambda.^2) % ����ɽ��ͷ���