clc, clear, ab0 = load('data11_1.txt');
mu = mean(ab0), sig = std(ab0) % ���ֵ�ͱ�׼��
rr = corrcoef(ab0) % �����ϵ������
ab = zscore(ab0); % ���ݱ�׼��
a = ab(:, [1:3]);
b = ab(:, [4:end]); % �����׼������Ա��������������
[XL, YL, XS, YS, BETA, PCTVAR, MSE, stats] = plsregress(a, b)
contr = cumsum(PCTVAR, 2) % ���ۻ�������
xw = a \ XS % ���Ա�������ɷ�ϵ����ÿ�ж�Ӧһ���ɷ֣����� xw ���� stats.W
yw = b \ YS % �����������ɷֵ�ϵ��
ncomp = input('����� PCTVAR ��ֵȷ������ɷֶԵĸ��� ncomp = ');
[XL2, YL2, XS2, YS2, BETA2, PCTVAR2, MSE2, stats2] = plsregress(a, b, ncomp)
n = size(a, 2);
m = size(b, 2); % n ���Ա����ĸ�����m ��������ĸ���
% ԭʼ���ݻع鷽�̵ĳ�����
beta3(1, :) = mu(n+1:end) - mu(1:n) ./ sig(1:n) * BETA2([2:end], :) .* sig(n+1:end);
% ����ԭʼ���� x1, ��, xn ��ϵ����ÿһ����һ���ع鷽��
beta3([2:n + 1], :) = (1 ./ sig(1:n))' * sig(n+1:end) .* BETA2([2:end], :)
bar(BETA2', 'k') % ��ֱ��ͼ
% �� y1, ��, ym ��Ԥ��ֵ
yhat = beta3(1, :) + ab0(:, [1:n]) * beta3([2:end], :)
ymax = max([yhat; ab0(:, [n + 1:end])]); % ��Ԥ��ֵ�͹۲�ֵ�����ֵ
%���滭 y1, y2, y3 ��Ԥ��ͼ������ֱ�� y = x
figure, subplot(2, 2, 1)
plot(yhat(:, 1), ab0(:, n+1), '*', [0:ymax(1)], [0:ymax(1)], 'Color', 'k')
legend('���ܳɼ�', 'Location', 'northwest')
xlabel('Ԥ������'), ylabel('�۲�����'), subplot(2, 2, 2)
plot(yhat(:, 2), ab0(:, n+2), 'O', [0:ymax(2)], [0:ymax(2)], 'Color', 'k')
legend('�����ɼ�', 'Location', 'northwest')
xlabel('Ԥ������'), ylabel('�۲�����'), subplot(2, 2, 3)
plot(yhat(:, 3), ab0(:, end), 'H', [0:ymax(3)], [0:ymax(3)], 'Color', 'k')
legend('���߳ɼ�', 'Location', 'northwest')
xlabel('Ԥ������'), ylabel('�۲�����')