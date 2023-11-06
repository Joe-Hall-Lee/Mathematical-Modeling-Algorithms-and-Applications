% 程序文件 ex12_13.m——问题四的红葡萄酒芳香物质的逐步回归模型
clc, clear
load data12_4.mat
s1 = readcell('附件3-芳香物质.xls','Range','E1:AE1');
s2 = extract(s1, digitsPattern)
s3 = char(s2), no = str2num(s3)
[sno, ind1] = sort(no); % 编号按照从小到大排列
b1 = readmatrix('附件3-芳香物质.xls', 'Range','E2:AE74');
ind = find(any(isnan(b1), 2)) % 找缺失值的行
b2 = rmmissing(b1); % 删除缺失值
c = b2(:, ind1); % 重排数据的列序
d = c'; e = zscore(d); % 数据标准化
% md = stepwiselm(e, y1) % 逐步线性回归
md = stepwiselm(e, y1, 'purequadratic') % 逐步二次式回归