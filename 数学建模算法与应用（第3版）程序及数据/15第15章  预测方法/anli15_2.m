clc, clear
a = load('anli15_2.txt'); % �ѱ��е����ݱ��浽�ı��ļ� anli15_2.txt
x = a(:, [1:4]);
y = a(:, 5); % ����Ա�����������Ĺ۲�ֵ
xb = max(x);
xs = min(x); % ���������ֵ����Сֵ
xg = 2 * (x - xs) ./ (xb - xs) - 1; % �Ա������ݹ�񻯵� [-1, 1]
xt = xg([1:end - 1], :)';
yt = y(1:end-1)'; % ���ѵ��������
net1 = newrb(xt, yt) % ѵ�� RBF ����
xn = xg(end, :)'; % ��ȡ���һ����������Ա����۲�ֵ
yn1 = sim(net1, xn) % ��Ԥ��ֵ
delta1 = abs(a(20, 5)-yn1) / a(20, 5) % ���� RBF ����Ԥ���������
net2 = feedforwardnet(4); % ��ʼ�� BP ���磬���������ԪȡΪ 4 ����������飩
net2 = train(net2, xt, yt); % ѵ�� BP ����
yn2 = net2(xn) % ��Ԥ��ֵ
delta2 = abs(a(20, 5)-yn2) / a(20, 5) % ���� BP ����Ԥ���������