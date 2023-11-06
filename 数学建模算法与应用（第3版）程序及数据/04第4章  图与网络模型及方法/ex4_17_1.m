clc, clear
a = zeros(8);
a(1, [2:4]) = [6, 4, 5];
a(2, [3, 5, 6]) = [3, 9, 9];
a(3, [4:7]) = [5, 6, 7, 3];
a(4, [3, 7]) = [2, 5];
a(5, 8) = 12;
a(6, [5, 8]) = [8, 10];
a(7, [6, 8]) = [4, 15];
G = digraph(a);
H = plot(G, 'EdgeLabel', G.Edges.Weight);
[M, F] = maxflow(G, 1, 8) % 使用默认 searchtrees 方法求最大流
F.Edges, highlight(H, F) % 显示最大流并画出最大流