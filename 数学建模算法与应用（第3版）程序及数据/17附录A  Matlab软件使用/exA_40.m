clc, clear
rng('shuffle') % ���ݵ�ǰʱ��Ϊ������������ṩ����
a = randn(6, 1); % ���ɷ��ӱ�׼��̬�ֲ���α�����
b = [today:today + 5]' % �ӽ��쵽���� 5 ��
c = datetime(b, 'ConvertFrom', 'datenum')
T = array2timetable(a, 'RowTimes', c) % ����ʱ����������
T.a(3) = NaN; %���� 3 �����ݱ�Ϊȱʧֵ NaN
newT = fillmissing(T, 'linear') % �����Բ�ֵ�ʱ�������е�ȱʧ����
data = table2array(newT) % ʱ����������ת����ͨ����