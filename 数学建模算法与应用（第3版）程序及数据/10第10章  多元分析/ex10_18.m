clc, clear, close all
a = readmatrix('data10_18_1.txt');
T = sum(sum(a));
P = a / T; % �����Ӧ���� P
r = sum(P, 2), c = sum(P) % �����Ե�ֲ�
R = a ./ sum(a, 2) % ���þ���㲥�����������ֲ���
B = (P - r * c) ./ sqrt((r * c)); % �����׼������ B
[u, s, v] = svd(B, 'econ') % �Ա�׼����������� B ������ֵ�ֽ�
lamda = diag(s).^2 % ���� B' * B ������ֵ��������������
ksi = T * (lamda) % ���㿨��ͳ�����ķֽ�
T_ksi = sum(ksi) % �����ܿ���ͳ����
con_rate = lamda / sum(lamda) % ���㹱����
cum_rate = cumsum(con_rate) % �����ۻ�������
beta = diag(r.^(-1 / 2)) * u; % ���Ȩ��������
G = beta * s % ������������
alpha = diag(c.^(-1 / 2)) * v; % ���Ȩ��������
F = alpha * s % ������������ F
num1 = size(G, 1); % ������ĸ���
rang = minmax(G(:, [1, 2])'); % �����ȡֵ��Χ
delta = (rang(:, 2) - rang(:, 1)) / (5 * num1); % ��ͼ�ı�עλ�õ�����
ch = {'A', 'B', 'C', 'D', 'E', 'F', 'G'};
yb = {'ɽ��', '���ɹ�', '����', '����', '������', '����', '�Ĵ�', '����', '����', '�ຣ'};
hold on
plot(G(:, 1), G(:, 2), '*', 'Color', 'k', 'LineWidth', 1.3) % ���е�ɢ��ͼ
text(G(:, 1)-delta(1), G(:, 2)-3*delta(2), yb) % ���е���б�ע
plot(F(:, 1), F(:, 2), 'H', 'Color', 'k', 'LineWidth', 1.3) % ���е�ɢ��ͼ
text(F(:, 1)+delta(1), F(:, 2), ch) % ���е���б�ע
xlabel('dim1'), ylabel('dim2')
writematrix([diag(s), lamda, ksi, con_rate, cum_rate], 'data10_18_2.xlsx')
ind1 = find(G(:, 1) > 0); % �����������һά���з���
rowclass = yb(ind1) % �����һ��������
ind2 = find(F(:, 1) > 0); % �����������һά���з���
colclass = ch(ind2) % �����һ�����