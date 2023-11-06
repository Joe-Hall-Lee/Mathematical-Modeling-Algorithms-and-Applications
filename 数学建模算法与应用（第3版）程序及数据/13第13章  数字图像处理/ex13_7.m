clc, clear
f0 = imread('tu7_1.bmp'); % 读入图像
f1 = double(f0); % 数据转换成 double 类型
for k = 1:3
    g(:, :, k) = dct2(f1(:, :, k)); % 对 R、G、B 各个分量分别作离散余弦变换
end
g(abs(g) < 0.1) = 0; % 把 DCT 系数小于 0.1 的变成 0
for k = 1:3
    f2(:, :, k) = idct2(g(:, :, k)); % 作逆 DCT 变换
end
f2 = uint8(f2); %把数据转换成 uint8 格式
imwrite(f2, 'tu7_2.bmp'); %把 f2 保存成 bmp 文件
subplot(1, 2, 1), imshow(f0)
subplot(1, 2, 2), imshow(f2)