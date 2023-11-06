clc, clear
d1 = readmatrix('附件3.xlsx', 'Range', 'B2:HVR256'); % 读入产地和吸光度数据
xi = find(isnan(d1(:, 1))) % 提出未知产地的药材编号
x1 = d1(xi, [2:end]); % 提出未知产地的近红外光谱数据
id = ~isnan(d1(:, 1)); % 已知产地的逻辑索引
y0 = d1(id, 1); % 提出已知产地编号
x01 = d1(id, [2:end]); % 提出已知产地药材的近红外特征

d2 = readmatrix('附件3.xlsx', 'Sheet', 2, 'Range', 'B2:EBR256');
x2 = d2(xi, [2:end]); % 提出未知产地的中红外光谱数据
x02 = d2(id, [2:end]); % 提出已知产地药材的中红外特征

X = [x1, x2]; % 未知样本点的特征数据
T = [x01, x02, y0]; % 构造训练集数据，标签数据和特征数据放在一起