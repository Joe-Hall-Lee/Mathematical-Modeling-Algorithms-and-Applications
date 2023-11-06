clc, clear
fi = dir('*.xlsx') % 提出 Excel 文件的信息，返回值是结构数组
n = length(fi); % 计算 Excel 文件的个数
d = cell(1, n); % 初始化
for k = 1:n
    d{k} = importdata(fi(k).name);
end
celldisp(d) % 显示细胞数组的数据