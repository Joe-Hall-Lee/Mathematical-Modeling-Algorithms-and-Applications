clc, clear
ob = VideoReader('test.avi') % ��ȡ��Ƶ�ļ�����
n = ob.NumFrames; % ��ȡ��Ƶ����֡��
for i = 1:n
    a = read(ob, i); % ��ȡ��Ƶ����ĵ� i ֡
    imshow(a) % ��ʾ�� i ֡ͼ��
    str = ['pic\', int2str(i), '.jpg']; % �����ļ������ַ�����Ŀ¼ pic Ҫ��ǰ����
    imwrite(a, str); % �ѵ� i ֡���浽 jpg �ļ�
end