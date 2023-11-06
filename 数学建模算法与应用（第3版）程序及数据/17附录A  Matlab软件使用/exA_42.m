clc, clear
ob = VideoReader('test.avi') % 读取视频文件对象
n = ob.NumFrames; % 获取视频的总帧数
for i = 1:n
    a = read(ob, i); % 读取视频对象的第 i 帧
    imshow(a) % 显示第 i 帧图像
    str = ['pic\', int2str(i), '.jpg']; % 构造文件名的字符串，目录 pic 要提前建好
    imwrite(a, str); % 把第 i 帧保存到 jpg 文件
end