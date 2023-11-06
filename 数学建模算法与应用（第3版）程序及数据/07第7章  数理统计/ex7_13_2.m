clc, clear, rng(1) % 取确定的随机数种子进行一致性比较
a = [18.2, 9.5, 12.0, 21.1, 10.2]; % 输入原始样本
b = bootstrp(1000, @(x)quantile(x, 0.5), a) % 计算各个 bootstrap 样本的中位数
c = std(b) % 计算中位数标准差