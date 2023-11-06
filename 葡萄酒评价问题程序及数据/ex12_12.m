% 程序文件 ex12_12.m——问题四的红葡萄酒逐步回归模型
clc, clear
load data12_4.mat, load data12_7.mat
md1 = stepwiselm(yh9, y1, 'purequadratic')