sx = [94, 109, 140, 278, 308, 330, 347];
oph = trainedModel.predictFcn(a(:, 3:end));
sol = oph(sx) % 提出预测产地答案
opc = op;
opc(opin) = oph(opin); % 补全产地数据
opc = categorical(opc); % 转换数据类型

T = array2table(a(:, 3:end)); % 构造表格数据
T.opc = opc; % 表格中添加字段
T.y = categorical(class); % 添加字段 y
X = T(sx, [1:end-1]); % 提出待判样本点数据
TT = T(tind, :); % 提出训练集数据