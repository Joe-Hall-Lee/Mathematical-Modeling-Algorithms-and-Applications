clc, clear
a = readmatrix('anli10_1.txt');
b = zscore(a); % ���ݱ�׼��
r = corrcoef(b); % �������ϵ������
% ����ֱ��ʹ�ñ�׼�����ݽ������ɷַ�����vec Ϊ r �����������������ɷֵ�ϵ��
[vec, score, lambda] = pca(b) % score Ϊ���ɷֵĵ÷֣�lambda Ϊ r ������ֵ
rate = lambda / sum(lambda) % ����������ɷֵĹ�����
contr = cumsum(rate) % �����ۻ�������
num = 4; % num Ϊѡȡ�����ɷֵĸ���
df = score(:, 1:num); % ����������ɷֵĵ÷�
tf = df * rate(1:num); % �����ۺϵ÷�
[stf, ind] = sort(tf, 'descend'); % �ѵ÷ְ��մӸߵ��͵Ĵ�������
stf = stf', ind = ind'