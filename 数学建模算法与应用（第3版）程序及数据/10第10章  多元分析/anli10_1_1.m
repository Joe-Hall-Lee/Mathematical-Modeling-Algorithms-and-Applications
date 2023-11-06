clc, clear, close all
a = readmatrix('anli10_1.txt');
b = zscore(a); % ���ݱ�׼��
r = corrcoef(b) % �������ϵ������
d = tril(1-r);
% d = nonzeros(d)'; % ����һ�ּ�����뷽��
z = linkage(b', 'average', 'correlation'); % ����ƽ��������
h = dendrogram(z); % ������ͼ
set(h, 'Color', 'k', 'LineWidth', 1.3) % �Ѿ���ͼ�ߵ���ɫ�ĳɺ�ɫ���߿�Ӵ�
T = cluster(z, 'maxclust', 6) % �ѱ������ֳ� 6 ��
for i = 1:6
    tm = find(T == i); % ��� i ��Ķ���
    fprintf('�� %d ����� %s \n', i, int2str(tm')); % ��ʾ������
end