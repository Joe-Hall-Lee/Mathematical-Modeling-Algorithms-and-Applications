clc, clear
r = readmatrix('anli10_5_1.txt'); % 读入相关系数矩阵
n1 = 5;
n2 = 7;
num = min(n1, n2);
s1 = r([1:n1], [1:n1]); %提出 X 与 X 的相关系数
s12 = r([1:n1], [n1 + 1:end]); % 提出 X 与 Y 的相关系数
s21 = s12'; % 提出 Y 与 X 的相关系数
s2 = r([n1 + 1:end], [n1 + 1:end]); % 提出 Y 与 Y 的相关系数
m1 = inv(s1) * s12 * inv(s2) * s21; % 计算矩阵 M1，式（10.60）
m2 = inv(s2) * s21 * inv(s1) * s12; % 计算矩阵 M2，式（10.60）
[vec1, val1] = eig(m1); %求 M1 的特征向量和特征值
for i = 1:n1
    vec1(:, i) = vec1(:, i) / sqrt(vec1(:, i)'*s1*vec1(:, i));
    %特征向量归一化，满足 a's1a = 1
    vec1(:, i) = vec1(:, i) * sign(sum(vec1(:, i)));
    %特征向量乘以 1 或 ﹣1，保证所有分量和为正
end
val1 = sqrt(diag(val1)); % 计算特征值的平方根
[val1, ind1] = sort(val1, 'descend'); % 按照从大到小排列
a = vec1(:, ind1(1:num)) % 取出 X 组的系数阵
dcoef1 = val1(1:num) % 提出典型相关系数
flag = 1; % 把计算结果写到 Excel 中的行计数变量
writematrix(a, 'anli10_5_2.xlsx', 'Sheet', 1, 'Range', 'A1')
flag = n1 + 2;
str = char(['A', int2str(flag)]); % str 为 Excel 中写数据的起始位置
writematrix(dcoef1', 'anli10_5_2.xlsx', 'Sheet', 1, 'Range', str)
[vec2, val2] = eig(m2);
for i = 1:n2
    vec2(:, i) = vec2(:, i) / sqrt(vec2(:, i)'*s2*vec2(:, i));
    vec2(:, i) = vec2(:, i) * sign(sum(vec2(:, i)));
end
val2 = sqrt(diag(val2)); % 计算特征值的平方根
[val2, ind2] = sort(val2, 'descend'); % 按照从大到小排列
b = vec2(:, ind2(1:num)) % 取出 Y 组的系数阵
dcoef2 = val2(1:num) % 提出典型相关系数
flag = flag + 2;
str = char(['A', int2str(flag)]);
writematrix(b, 'anli10_5_2.xlsx', 'Sheet', 1, 'Range', str)
flag = flag + n2 + 1;
str = char(['A', int2str(flag)]);
writematrix(dcoef2', 'anli10_5_2.xlsx', 'Sheet', 1, 'Range', str)
x_u_r = s1 * a % x、u 的相关系数
y_v_r = s2 * b % y、v 的相关系数
x_v_r = s12 * b % x、v 的相关系数
y_u_r = s21 * a % y、u 的相关系数
flag = flag + 2;
str = char(['A', int2str(flag)]);
writematrix(x_u_r, 'anli10_5_2.xlsx', 'Sheet', 1, 'Range', str)
flag = flag + n1 + 1;
str = char(['A', int2str(flag)]);
writematrix(y_v_r, 'anli10_5_2.xlsx', 'Sheet', 1, 'Range', str)
flag = flag + n2 + 1;
str = char(['A', int2str(flag)]);
writematrix(x_v_r, 'anli10_5_2.xlsx', 'Sheet', 1, 'Range', str)
flag = flag + n1 + 1;
str = char(['A', int2str(flag)]);
writematrix(y_u_r, 'anli10_5_2.xlsx', 'Sheet', 1, 'Range', str)
mu = sum(x_u_r.^2) / n1 % x 组原始变量被 u_i 解释的方差比例
mv = sum(x_v_r.^2) / n1 % x 组原始变量被 v_i 解释的方差比例
nu = sum(y_u_r.^2) / n2 % y 组原始变量被 u_i 解释的方差比例
nv = sum(y_v_r.^2) / n2 % y 组原始变量被 v_i 解释的方差比例
fprintf('X 组的原始变量被 u1~u%d 解释的比例为 %f\n', num, sum(mu));
fprintf('Y 组的原始变量被 v1~v%d 解释的比例为 %f\n', num, sum(nv));