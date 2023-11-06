clc, clear, syms y(x)
dy = diff(y);
s1 = dsolve((1 - x)*diff(y, 2) == sqrt(1+dy^2)/5, y(0) == 0, dy(0) == 0)
s2 = simplify(s1)