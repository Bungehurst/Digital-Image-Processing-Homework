function re=find_set(p,i)   %���ཻ����Ѱ�Ҵ���ǰ���ϵ���Сֵ��������㷨���ۡ���21��
    if min(p{i}) ~= i
        i=find_set(p,min(p{i}));
    end
    re=i;
end