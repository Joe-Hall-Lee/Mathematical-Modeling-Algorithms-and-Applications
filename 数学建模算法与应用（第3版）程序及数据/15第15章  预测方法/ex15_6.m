clc, clear, fid = fopen('data15_6.txt');
a = textscan(fid, '%s');
b = strjoin(a{:}, ''); % 连接符为空字符''
for i = 0:1
    for j = 0:1
        s = [int2str(i), int2str(j)]; % 构造子字符串 ij’
        f(i+1, j+1) = length(strfind(b, s)); % 计算子串 ij  的个数
    end
end
fs = sym(sum(f, 2)); % 求 f 矩阵的行和,并转换为符号数
p = f ./ fs % 求状态转移频率