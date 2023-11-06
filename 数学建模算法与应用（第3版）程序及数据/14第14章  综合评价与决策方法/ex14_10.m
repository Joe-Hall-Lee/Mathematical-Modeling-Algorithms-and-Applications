clc, clear, close all
N = 6;
B = zeros(N);
B(1, 2) = 1;
B(2, [3, 4]) = 1;
B(3, [4:6]) = 1;
B(4, 1) = 1;
B(5, 6) = 1;
B(6, 1) = 1;
nodes = {'1.alpha', '2.beta', '3.gamma', '4.delta', '5.rho', '6.sigma'};
G = digraph(B, nodes);
plot(G, 'LineWidth', 1.5, 'NodeFontSize', 12, 'ArrowSize', 12)
r = sum(B, 2);
d = 0.85;
A = (1 - d) / N + d * B ./ r % ����ת�Ƹ��ʾ���
[x, y] = eigs(A', 1); % ���������ֵ��Ӧ����������
x = x / sum(x) % ����������һ��
figure, bar(x) % �� PageRank ֵ����״ͼ