function  Out = zigzag( input )
[m,n] = size(input);
Out = zeros(1,m*n);
i = 1;j = 1;cnt = 1;
while 1
         if i+j > m+n 
            break;
         elseif j == 1 && rem((i+j),2) == 0 
            Out(1,cnt) = input(i,j);
            i = i + 1;       
        elseif i == 1 && rem((i+j),2) ~= 0 && j ~= n
            Out(1,cnt) = input(i,j);
            j = j + 1;
        elseif i == 1 && rem((i+j),2) ~= 0 && j == n
            Out(1,cnt) = input(i,j);
            i = i + 1;        
        elseif i == m && rem((i+j),2) == 0
            Out(1,cnt) = input(i,j);
             j = j + 1;
        elseif j == n && rem((i+j),2) ~= 0
            Out(1,cnt) = input(i,j);
            i = i + 1;
        elseif rem((i+j),2) ~= 0 
            Out(1,cnt) = input(i,j);
            i = i - 1;
            j = j + 1;
        elseif rem((i+j),2) == 0
            Out(1,cnt) = input(i,j);
            i = i + 1;
            j = j - 1;
        end 
        cnt=cnt+1;  
end
end

