clc, clear, close all
a = readmatrix('anli10_1.txt');
a(:, [3:6]) = []; % ɾ�����ݾ���ĵ� 3 �С��� 6 �У���ʹ�ñ��� 1��2��7��8��9��10
b = zscore(a); % ���ݱ�׼��
z = linkage(b, 'average'); % ����ƽ��������
h = dendrogram(z); % ������ͼ
set(h, 'Color', 'k', 'LineWidth', 1.3) % �Ѿ���ͼ�ߵ���ɫ�ĳɺ�ɫ���߿�Ӵ�
for k = 3:5
    fprintf('���ֳ� %d ��Ľ�����£�\n', k)
    T = cluster(z, 'maxclust', k); % �������㻮�ֳ� k ��
    for i = 1:k
        tm = find(T == i); % ��� i ��Ķ���
        fprintf('�� %d ����� %s \n', i, int2str(tm')); % ��ʾ������
    end
    fprintf('**********************************\n');
end