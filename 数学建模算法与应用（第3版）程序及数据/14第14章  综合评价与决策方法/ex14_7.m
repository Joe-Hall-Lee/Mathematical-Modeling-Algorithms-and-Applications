clc, clear
gj = load('data14_7.txt');
gj = zscore(gj); % ���ݱ�׼��
r = corrcoef(gj); % �������ϵ������
% ����ֱ��ʹ�ñ�׼�����ݽ������ɷַ�����vec Ϊ r �����������������ɷֵ�ϵ��
[vec, score, lambda] = pca(gj) % score Ϊ���ɷֵĵ÷֣�lambda Ϊ r ������ֵ
rate = lambda / sum(lambda) % ����������ɷֵĹ�����
contr = cumsum(rate) % �����ۻ�������
num = 3; % num Ϊѡȡ�����ɷֵĸ���
tf = score(:, [1:num]) * rate(1:num); % �����ۺϵ÷�
[stf, ind] = sort(tf, 'descend'); % �ѵ÷ְ��մӸߵ��͵Ĵ�������
stf = stf', ind = ind'