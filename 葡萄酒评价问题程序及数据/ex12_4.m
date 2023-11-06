% 读第二组白葡萄酒数据
clc, clear
a = readmatrix('附件1-葡萄酒品尝评分表g.xls', 'Sheet', 4, 'Range', 'A4:N338');
no = a(1:12:end, 1); % 提出编号数据
[sno, ind] = sort(no) % 按照从小到大排列编号
f = []; % 酒品总评分的初始值
for i = 1:28
    td = a(12*(i-1)+1:12*(i-1)+10, 5:end);
    b = sum(td); % 逐列求和，计算每个酒品的总评分
    f = [f; b];
end
sf = f(ind, :) % 按照样本编号从小到大重排数据
warning('off')
writematrix(sf, 'data12_1.xlsx', 'Sheet', 4)