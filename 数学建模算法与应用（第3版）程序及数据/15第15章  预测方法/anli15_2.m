clc, clear
a = load('anli15_2.txt'); % 把表中的数据保存到文本文件 anli15_2.txt
x = a(:, [1:4]);
y = a(:, 5); % 提出自变量和因变量的观测值
xb = max(x);
xs = min(x); % 逐列求最大值和最小值
xg = 2 * (x - xs) ./ (xb - xs) - 1; % 自变量数据规格化到 [-1, 1]
xt = xg([1:end - 1], :)';
yt = y(1:end-1)'; % 提出训练集数据
net1 = newrb(xt, yt) % 训练 RBF 网络
xn = xg(end, :)'; % 提取最后一个样本点的自变量观测值
yn1 = sim(net1, xn) % 求预测值
delta1 = abs(a(20, 5)-yn1) / a(20, 5) % 计算 RBF 网络预测的相对误差
net2 = feedforwardnet(4); % 初始化 BP 网络，隐含层的神经元取为 4 个（多次试验）
net2 = train(net2, xt, yt); % 训练 BP 网络
yn2 = net2(xn) % 求预测值
delta2 = abs(a(20, 5)-yn2) / a(20, 5) % 计算 BP 网络预测的相对误差