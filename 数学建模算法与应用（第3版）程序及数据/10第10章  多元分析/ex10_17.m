clc, clear, close all, format long g
a = readmatrix('data10_17_1.txt');
T = sum(sum(a));
P = a / T; % �����Ӧ���� P
r = sum(P, 2), c = sum(P) % �����Ե�ֲ�
R = a ./ sum(a, 2) % �����������ֲ���
% B = diag(1./sqrt(r)) * (P - r * c) * diag(1./sqrt(c));
B = (P - r * c) ./ sqrt((r * c)); % �����׼������ B
[u, s, v] = svd(B, 'econ') % �Ա�׼����������� B ������ֵ�ֽ�
lamda = diag(s).^2 % ���� B' * B ������ֵ�����������
ksi = T * (lamda) % ���㿨��ͳ�����ķֽ�
T_ksi = sum(ksi) % �����ܿ���ͳ����
con_rate = lamda / sum(lamda) % ���㹱����
cum_rate = cumsum(con_rate) % �����ۻ�������
beta = diag(r.^(-1 / 2)) * u; % ���Ȩ��������
G = beta * s % ������������
alpha = diag(c.^(-1 / 2)) * v; % ���Ȩ��������
F = alpha * s % ������������ F
num = size(G, 1);
rang = minmax(G(:, 1)'); % �����ȡֵ��Χ
delta = (rang(2) - rang(1)) / (8 * num); % ��ͼ�ı�עλ�õ�����
ch = 'LPSBEM'; hold on
for i = 1:num
    plot(G(i, 1), G(i, 2), '*', 'Color', 'k', 'LineWidth', 1.3) % ���е�ɢ��ͼ
    text(G(i, 1)+delta, G(i, 2), ch(i)) %���е���б�ע
    plot(F(i, 1), F(i, 2), 'H', 'Color', 'k', 'LineWidth', 1.3) % ���е�ɢ��ͼ
    text(F(i, 1)+delta, F(i, 2), int2str(i+1972)) % ���е���б�ע
end
xlabel('dim1'), ylabel('dim2'), format
writematrix([diag(s), lamda, ksi, con_rate, cum_rate], 'data10_17_2.xlsx')
warning("off"), writematrix(R, "data10_17_2.xlsx", "Sheet", 2)
writematrix([G(:, 1:2)'; F(:, 1:2)'], "test.xlsx")