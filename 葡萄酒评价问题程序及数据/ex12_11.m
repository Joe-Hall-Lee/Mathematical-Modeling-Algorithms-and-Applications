clc, clear
load data12_6.mat
% y2——单宁
y2 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 2, 'Range', 'K33:K60');
% y3——总酚
y3 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 2, 'Range', 'O33:O60');
% y4——酒总黄酮
y4 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 2, 'Range', 'S33:S60');
% y5——白藜芦醇
y5 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 2, 'Range', 'T33:T60');
% y6——DPPH 半抑制体积（IV50） 1 / IV50
y6 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 2, 'Range', 'AC33:AC60');
% y7——L*
y7 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 2, 'Range', 'AD33:AD60');
% y8——a*
y8 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 2, 'Range', 'AE33:AE60');
% y9——b*
y9 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 2, 'Range', 'AF33:AF60');
yb9 = [y2, y3, y4, y5, y6, y7, y8, y9];
% yb9 = zscore(yh); % 数据标准化
md1 = stepwiselm(xx, yb9(:, 1)) % 逐步线性回归
md2 = stepwiselm(xx, yb9(:, 2)) % 逐步线性回归
md3 = stepwiselm(xx, yb9(:, 3)) % 逐步线性回归
md4 = stepwiselm(xx, yb9(:, 4)) % 逐步线性回归
md5 = stepwiselm(xx, yb9(:, 5)) % 逐步线性回归
md6 = stepwiselm(xx, yb9(:, 6)) % 逐步线性回归
md7 = stepwiselm(xx, yb9(:, 7)) % 逐步线性回归
md8 = stepwiselm(xx, yb9(:, 8)) % 逐步线性回归
save data12_8.mat yb9 % 保存数据供下面问题使用