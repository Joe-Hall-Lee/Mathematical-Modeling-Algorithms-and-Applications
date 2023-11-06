% 程序文件 ex12_8.m——红葡萄分级计算
clc, clear
y0 = readmatrix('data12_1.xlsx', 'Sheet', 2); % 读入第二组红葡萄酒数据
y1 = mean(y0, 2); % 计算每种红葡萄酒的平均评分
% x1——氨基酸总量
x1 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'C3:C29');
% x2——蛋白质
x2 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'X3:X29');
% x3——VC 含量
x3 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'AA3:AA29');
% x4——花色苷
x4 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'AE3:AE29');
% x5——酒石酸
x5 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'AF3:AF29');
% x6——苹果酸
x6 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'AH3:AH29');
% x7——柠檬酸
x7 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'AJ3:AJ29');
% x8——多酚氧化酶活力
x8 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'AO3:AO29');
% x9——褐变度
x9 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'AS3:AS29');
% x10——DPPH 自由基 1 / IC50
x10 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'AW3:AW29');
% x11——总酚
x11 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'BA3:BA29');
% x12——单宁
x12 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'BE3:BE29');
% x13——普通总黄酮
x13 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'BI3:BI29');
% x14——白藜芦醇
x14 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'BJ3:BJ29');
% x15——黄酮醇
x15 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'BP3:BP29');
% x16——总糖
x16 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'BY3:BY29');
% x17——还原糖
x17 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'BZ3:BZ29');
% x18——PH 值
x18 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'CK3:CK29');
% x19——固酸比
x19 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'CS3:CS29');
% x20——干物质含量
x20 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'CW3:CW29');
% x21——果穗质量
x21 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'DA3:DA29');
% x22——百粒质量
x22 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'DE3:DE29');
% x23——果梗比
x23 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'DI3:DI29');
% x24——出汁率
x24 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'DM3:DM29');
% x25——果皮质量
x25 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'DQ3:DQ29');
% x26——L*
x26 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'DU3:DU29');
% x27——a*
x27 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'DY3:DY29');
% x28——b*
x28 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 1, 'Range', 'EC3:EC29');
x = [x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, ...
    x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28];
xx = zscore(x); % 数据标准化
% md = stepwiselm(xx, y1, 'purequadratic') % 逐步二次多项式回归
md = stepwiselm(xx, y1) % 逐步线性回归
yh = predict(md, xx) % 计算红葡萄酒的预期评分
% [idx, c] = kmeans(y1, 4) % 计算不稳定
% sc = sort(c, 'descend')
z = linkage(y1); t = cluster(z, 4) % 系统聚类法中的最短距离聚类
yy(1) = mean(y1(t == 1));
yy(2) = mean(y1(t == 2));
yy(3) = mean(y1(t == 3)); yy(4) = mean(y1(t == 4))
syy = sort(yy, 'descend') % 几何中心按照降序排列
d = abs(yh-syy); % 计算欧氏距离
[m1, i1] = min(d, [], 2) % 葡萄样本的评级
dd = abs(y1-syy); % 计算真实评分与基准分之间的欧氏距离
[m2, i2] = min(dd, [], 2)
rate = sum(i1 == i2) / length(i1) % 计算准确度
writematrix(i1', 'dataa12_3.csv')
save data12_4.mat xx y1 % 保存数据供下面问题使用