clc, clear, d = cell(1, 5); % ��ʼ��
for k = 1:5
    fileName = sprintf('A_38_%02d.xlsx', k);
    d{k} = readmatrix(fileName, 'Sheet', 2, 'Range', 'A1:C3');
end
celldisp(d) %��ʾϸ����������� 