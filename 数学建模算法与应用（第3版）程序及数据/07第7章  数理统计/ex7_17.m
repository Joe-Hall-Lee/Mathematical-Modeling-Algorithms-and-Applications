clc, clear, rng(10) % 进行一致性比较
x0 = [342, 500, 187];
theta = (x0(2) + 2 * x0(3)) / sum(x0) / 2 % 计算最大似然估计
fb = [(1 - theta)^2, 2 * theta * (1 - theta), theta^2] % 计算分布律
cf = cumsum(fb) % 求累计分布
a = rand(1029, 1000); % 每一列随机数对应一个 bootstrap 样本
jx1 = (a <= cf(1)); % 1 对应 M 出现
jx2 = (a > cf(1) & a <= cf(2)); % 1 对应 MN 出现
jx3 = (a >= cf(2)); % 1 对应 N 出现
x1 = sum(jx1);
x2 = sum(jx2);
x3 = sum(jx3);
theta2 = (x2 + 2 * x3) / 1029 / 2; % 计算统计量 theta 的值
stheta = sort(theta2); % 把统计量按照从小到大排序
qj = [stheta(50), stheta(950)] % 提出置信区间的取值