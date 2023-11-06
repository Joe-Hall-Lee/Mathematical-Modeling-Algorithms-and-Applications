clc, clear, close all, a = readmatrix('anli10_7_1.txt');
a_i_dot = sum(a, 2) % �����к�
a_dot_j = sum(a) % �����к�
T = sum(a_i_dot) % �������ݵ��ܺ�
P = a / T; % �����Ӧ���� P
r = sum(P, 2), c = sum(P) % �����Ե�ֲ�
Row_prifile = a ./ sum(a, 2) % �����������ֲ���
B = (P - r * c) ./ sqrt((r * c)); % �����׼������ B
[u, s, v] = svd(B, 'econ') % �Ա�׼����������� B ������ֵ�ֽ�
lamda = diag(s).^2 % ���� B' * B ������ֵ,���������
ksi = T * (lamda) % ���㿨��ͳ�����ķֽ�
T_ksi = sum(ksi) % �����ܿ���ͳ����
con_rate = lamda / sum(lamda) % ���㹱����
cum_rate = cumsum(con_rate) % �����ۻ�������
beta = diag(r.^(-1 / 2)) * u; % ���Ȩ��������
G = beta * s % ������������ G
alpha = diag(c.^(-1 / 2)) * v; % ���Ȩ��������
F = alpha * s % ������������ F
num1 = size(G, 1); % ������ĸ���
rang = minmax(G(:, [1, 2])'); % �������ȡֵ��Χ
delta = (rang(:, 2) - rang(:, 1)) / (4 * num1); % ��ͼ�ı�עλ�õ�����
chrow = {'A', 'B', 'C', 'D', 'E'};
strcol = {'����', '��Ů', '����', '����', 'ũ��', 'ʿ��', '����', '����'};
hold on
plot(G(:, 1), G(:, 2), '*', 'Color', 'k', 'LineWidth', 1.3) % ���е�ɢ��ͼ
text(G(:, 1), G(:, 2)-delta(2), chrow) % ���е���б�ע
plot(F(:, 1), F(:, 2), 'H', 'Color', 'k', 'LineWidth', 1.3) % ���е�ɢ��ͼ
text(F(:, 1)-delta(1), F(:, 2)+1.2*delta(2), strcol) % ���е���б�ע
xlabel('dim1'), ylabel('dim2')
writematrix([diag(s), lamda, ksi, con_rate, cum_rate], 'anli10_7_2.xlsx')
dd = dist(G(:, 1:2), F(:, 1:2)') % �������������Ӧ������֮��ľ���