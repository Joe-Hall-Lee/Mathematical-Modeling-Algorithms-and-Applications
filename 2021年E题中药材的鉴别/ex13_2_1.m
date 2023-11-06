clc, clear, close all
bd = readmatrix('附件2.xlsx', 'Range', 'C1:EBR1'); % 读入波数数据
d = readmatrix('附件2.xlsx', 'Range', 'B2:EBR674'); % 读入产地和吸光度数据
xi = find(isnan(d(:, 1))) % 提出未知产地的药材编号
X = d(xi, [2:end]); % 提出未知产地的吸光度数据
id = ~isnan(d(:, 1)); % 已知产地的逻辑索引
y0 = d(id, 1); % 提出已知产地编号
y0u = unique(y0)
x0 = d(id, [2:end]); % 提出已知产地药材的特征
T = [x0, y0]; % 构造训练数据集，标签数据和特征数据放在一起
for i = 1:11
    ind = find(y0 == i); subplot(3, 4, i)
    plot(bd', x0(ind, :)')
    xlabel('波数（cm^{-1}');
    ylabel('吸光度（AU）');
    title(['产地', int2str(i), '药材的中红外光谱曲线'])
end