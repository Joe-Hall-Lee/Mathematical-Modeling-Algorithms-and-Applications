clc, clear
mydata = cell(1, 5); % ��ʼ����Ÿ����ļ����ݵ�ϸ������
for k = 1:5
    filename = sprintf('A_37_%d.xlsx', k); % �����ļ����ĸ�ʽ���ַ���
    mydata{k} = importdata(filename); % ���ļ���������
end
celldisp(mydata) % ��ʾϸ�����������