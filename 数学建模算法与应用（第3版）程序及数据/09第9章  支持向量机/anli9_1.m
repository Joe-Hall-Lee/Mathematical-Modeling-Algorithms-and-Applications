% ԭʼ���� cancerdata.txt �����������أ������е� B �滻�� 1��M �滻�� -1��X �滻�� 2��ɾ���˷ָ�� *���滻������������� cancerdata2.txt����������������ݱ�׼��
clc, clear
a = load('cancerdata2.txt');
a(:, 1) = []; % ɾ����һ�в�����
gind = find(a(:, 1) == 1); % �����������������
bind = find(a(:, 1) == -1); % �����������������
group(gind, 1) = 1;
group(bind, 1) = -1; % ��֪������������
train0 = a([1:500], [2:end]); % �����֪�����������
mu = mean(train0), sig = std(train0) % ����֪������ľ�ֵ�ͱ�׼��
train = (train0 - mu) ./ sig; % ���þ���㲥����֪���������ݱ�׼��
xa0 = a([501:569], [2:end]); % �������������
xa = (xa0 - mu) ./ sig; % ���������ݱ�׼��
s = fitcsvm(train, group, 'Standardize', true, 'KernelFunction', 'rbf', ...
    'KernelScale', 'auto');
sv_index = find(s.IsSupportVector') % ����֧�������ı��
beta = s.Alpha' % ���ط��ຯ����Ȩϵ��
b = s.Bias % ���ط��ຯ���ĳ�����
check = predict(s, train); % ��֤��֪������
err_rate = 1 - sum(group == check) / length(group) % ���������
solution = predict(s, xa) % ���д������������
sg = find(solution == 1) % ������������е����Ա��
sb = find(solution == -1) % ������������еĶ��Ա��