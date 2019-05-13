function re=find_set(p,i)   %不相交集合寻找代表当前集合的最小值，详见《算法导论》第21章
    if min(p{i}) ~= i
        i=find_set(p,min(p{i}));
    end
    re=i;
end