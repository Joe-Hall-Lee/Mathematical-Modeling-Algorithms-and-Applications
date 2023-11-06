clc, clear, c = zeros(1, 7);
for y = 1601:2000
    for m = 1:12
        d = datetime(y, m, 13);
        w = weekday(d);
        c(w) = c(w) + 1;
    end
end
c, bar(c) % ��ʾƵ��������Ƶ������״ͼ
axis([0, 8, 680, 690])
line([0, 8], [4800 / 7, 4800 / 7], 'linewidth', 4, 'color', 'k')
set(gca, 'xticklabel', {'Su', 'M', 'Tu', 'W', 'Th', 'F', 'Sa'})