clc, clear, close all
D=[0, 1, sqrt(3), 2, sqrt(3), 1, 1; zeros(1,2),1, sqrt(3), 2, sqrt(3), 1
   zeros(1,3),1, sqrt(3), 2, 1;zeros(1,4), 1, sqrt(3), 1
   zeros(1,5), 1, 1; zeros(1,6), 1; zeros(1,7)]  %ԭʼ��������������Ԫ��
d=D+D'; %���������ľ������
[y,eigvals]=cmdscale(d)  %�󾭵��,d����Ϊʵ�Գƾ����pdist���������������
plot(y(:,1),y(:,2),'o','Color','k','LineWidth',1.3)   %�����������
%��������ͨ������ֵ�����������󾭵��
A=-d.^2/2;   %����A����
n=size(A,1); H=eye(n)-ones(n)/n;  %����H����
B=H*A*H;   %����B����
[vec1,val1]=eig(B);  %��B�������������vec1������ֵval1
[val2,ind]=sort(diag(val1),'descend') %���������Ӵ�С����
vec2=vec1(:,ind)  %��Ӧ�ذ���������Ҳ��������
vec3=orth(vec2(:,[1,2])); %����������������
point=vec3.*sqrt(val2(1:2)')   %���þ���㲥��������
hold on
plot(point(:,1),point(:,2),'D','Color','k','LineWidth',1.3)   %��֤��һ��
theta=0.485;      %��ת�ĽǶ�
T=[cos(theta),-sin(theta);sin(theta),cos(theta)];
Tpoint=point*T;   %�ѽ���������任
plot(Tpoint(:,1),Tpoint(:,2),'+','Color','k','LineWidth',1.3)  %��֤һ��
legend({'Matlab����cmdscale��õĽ�','�����㷨��õ�һ����',...
       '�����任��õ�����cmdscale��ͬ�Ľ�'},'Location','best')
