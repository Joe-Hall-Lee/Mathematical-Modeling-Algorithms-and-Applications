clc, clear
a = load('data14_3.txt');
w = [0.4, 0.3, 0.2, 0.1];
w1 = [0.2, 0.3, 0.3, 0.2];
w2 = [0.3, 0.2, 0.1, 0.2, 0.2];
w3 = [0.1, 0.2, 0.3, 0.2, 0.2];
w4 = [0.3, 0.2, 0.2, 0.3];
b(1, :) = w1 * a([1:4], :);
b(2, :) = w2 * a([5:9], :);
b(3, :) = w3 * a([10:14], :);
b(4, :) = w4 * a([15:end], :)
c = w * b