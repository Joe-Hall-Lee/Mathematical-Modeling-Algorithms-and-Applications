clc, clear
x1 = [6.683, 6.681, 6.676, 6.678, 6.679, 6.672];
x2 = [6.661, 6.661, 6.667, 6.667, 6.664];
[h, p, ci, st] = ttest2(x1, x2, 'Alpha', 0.1)