a = [2, -2, 0; -2, 4, 0; 0, 0, 5];
b = eig(a) % 求矩阵 a 的特征值
if all(b > 0)
    fprintf('二次型正定\n')
else
    fprintf('二次型非正定\n')
end