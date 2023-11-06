xt = @(t)cos(t);
yt = @(t)2 * sin(t);
fplot(xt, yt) % 参数方程绘图
figure, fimplicit(@(x, y)x.^2+y.^2/4-1) % 隐函数绘图