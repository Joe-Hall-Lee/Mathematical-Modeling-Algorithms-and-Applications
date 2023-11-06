% 读第一组红葡萄酒数据
clc, clear
a = readcell("附件1-葡萄酒品尝评分表g.xls", "Range", "A3:L378");
s1 = a(1:14:end, 1), s2 = extract(s1, digitsPattern)
s3 = char(s2), no = str2num(s3) % 把字符串数组转换为数值数组
f = []; % 酒品总评分的初始值
for i = 1:27
    td1 = a(14*(i-1)+3:14*i-2, 3:12);
    td2 = cell2mat(td1); % 把元胞数组转换为普通数值数组
    b = sum(td2); % 逐列求和，计算每个酒品的总评分
    f = [f; b];
end
[sno, ind] = sort(no) % 对酒品编号按照从小到大排序
sf = f(ind, :) % 按照样本编号从小到大重排顺序
writematrix(sf, 'data12_1.xlsx')