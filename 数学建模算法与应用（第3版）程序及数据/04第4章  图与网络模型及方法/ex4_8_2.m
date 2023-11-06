clc, clear, a = zeros(4);
a(1, [3, 4]) = [10, 60];
a(2, [3, 4]) = [5, 20];
a(3, 4) = 1;
G = graph(a, 'upper');
d = distances(G, 'Method', 'positive')