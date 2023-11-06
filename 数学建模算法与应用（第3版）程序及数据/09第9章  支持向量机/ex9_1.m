clc, clear
a = readmatrix('data9_1.txt');
c = a([1:27], :);
x = a([28:end], :); % 提取已分类和待分类的数据
mu = mean(c), sig = std(c) % 求已知样本点的均值和标准差
d = (c - mu) ./ sig; % 利用矩阵广播，对已知样本点数据标准化
xx = (x - mu) ./ sig; % 待分类数据标准化
group = [ones(20, 1); -ones(7, 1)]; % 已知样本点的类别标号
s = fitcsvm(d, group) % 训练支持向量机分类器
sv_index = find(s.IsSupportVector) % 返回支持向量的标号
beta = s.Alpha % 返回分类函数的权系数
bb = s.Bias % 返回分类函数的常数项
check = predict(s, d) % 验证已知样本点
err_rate = 1 - sum(group == check) / length(group) % 计算已知样本点的错判率
solution = predict(s, xx) % 对待判样本点进行分类