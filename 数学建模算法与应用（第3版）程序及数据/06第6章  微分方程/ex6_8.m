clc, clear, syms f(x) g(x) % 定义符号函数
df = diff(f); % 定义 f 的一阶导数
[s1, s2] = dsolve(diff(f, 2)+g == 3, diff(g)+diff(f) == 1, ...
    df(1) == 0, f(0) == 0, g(0) == 0)