clc, clear
a = readmatrix('附件4（改）.xlsx', 'Range', 'B2:HVS400');
op = a(:, 2); opin = find(isnan(op)) % 提出未知产地的药材编号
class = a(:, 1); % 提出类别数据
xind = isnan(class); % 类别未知的逻辑索引
tind = ~xind; % 类别已知的逻辑索引
ind = find(~isnan(op)); % 提出已知产地的药材编号
T = [a(ind, [3:end]), a(ind, 2)];