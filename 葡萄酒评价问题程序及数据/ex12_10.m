clc, clear
load data12_4.mat
% y1——花色苷
y1 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 2, 'Range', 'F3:F29');
% y2——单宁
y2 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 2, 'Range', 'K3:K29');
% y3——总酚
y3 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 2, 'Range', 'O3:O29');
% y4——酒总黄酮
y4 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 2, 'Range', 'S3:S29');
% y5——白藜芦醇
y5 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 2, 'Range', 'T3:T29');
% y6——DPPH 半抑制体积（IV50） 1 / IV50
y6 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 2, 'Range', 'AC3:AC29');
% y7——L*
y7 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 2, 'Range', 'AD3:AD29');
% y8——a*
y8 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 2, 'Range', 'AE3:AE29');
% y9——b*
y9 = readmatrix('附件2-指标总表（改）.xls', 'Sheet', 2, 'Range', 'AF3:AF29');
yh9 = [y1, y2, y3, y4, y5, y6, y7, y8, y9];
md1 = stepwiselm(xx, yh9(:, 1)) % 逐步线性回归
md2 = stepwiselm(xx, yh9(:, 2)) % 逐步线性回归
md3 = stepwiselm(xx, yh9(:, 3)) % 逐步线性回归
md4 = stepwiselm(xx, yh9(:, 4)) % 逐步线性回归
md5 = stepwiselm(xx, yh9(:, 5)) % 逐步线性回归
md6 = stepwiselm(xx, yh9(:, 6)) % 逐步线性回归
md7 = stepwiselm(xx, yh9(:, 7)) % 逐步线性回归
md8 = stepwiselm(xx, yh9(:, 8)) % 逐步线性回归
md9 = stepwiselm(xx, yh9(:, 9)) % 逐步线性回归
save data12_7.mat yh9 % 保存数据供下面问题使用