clc, clear, T = dctmtx(8); % 8 × 8 的 DCT 变换矩阵
colormap('gray'); % 设置颜色映射矩阵
for m = 1:8
    for n = 1:8
        subplot(8, 8, (m - 1)*8+n);
        Y = zeros(8);
        Y(m, n) = 1; % 8 × 8 矩阵中只有一个元素为 1，其余元素都为 0
        X = T' * Y * T; % 做逆 DCT 变换
        imagesc(X); % 显示图像
        axis square % 画图区域是方形
        axis off % 不显示轴线和标号
    end
end