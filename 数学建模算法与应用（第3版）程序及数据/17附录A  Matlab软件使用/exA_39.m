clc, clear
fi = dir('*.xlsx') % ��� Excel �ļ�����Ϣ������ֵ�ǽṹ����
n = length(fi); % ���� Excel �ļ��ĸ���
d = cell(1, n); % ��ʼ��
for k = 1:n
    d{k} = importdata(fi(k).name);
end
celldisp(d) % ��ʾϸ�����������