clc, clear
a = [1, 0; 1, 1; 3, 2; 4, 3; 2, 5];
z = linkage(a, 'single', 'cityblock') % �����ȼ�������
dendrogram(z) % ������ͼ
T = cluster(z, 'maxclust', 3) % �Ѷ��󻮷ֳ� 3 ��
for i = 1:3
    tm = find(T == i); % ��� i ��Ķ���
    fprintf('�� %d ����� %s \n', i, int2str(tm')); % ��ʾ������
end