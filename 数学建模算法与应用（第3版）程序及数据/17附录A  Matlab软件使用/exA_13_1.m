clc, clear, syms x
dy = diff(log((x + 2)/(1 - x)), x, 3)
dy = simplify(dy) % �Է��ź������л���
a = [0, 0.5, 2, 4]; da = diff(a)