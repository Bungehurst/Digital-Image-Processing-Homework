img = imread('123.jpg');
img = rgb2gray(img);
[m,n]=size(img);
g_out = zeros(m,n);

level = 8;
thresh = zeros(1,level);
num = zeros(1,level);
prop = zeros(1,level);
for i = 1:level
    thresh(i) = 255 * (i-1) / (level-1);
end
for i = 1:m
    for j = 1:n
        for k = 1:(level-1)
            if img(i,j) > thresh(k) && img(i,j) < thresh(k + 1) 
                num(k) = num(k) + 1;
            end  
        end
    end
end

for k = 1:level
    sum = 0;
    for i = 1:k
       sum = sum + num(i);
    end 
    prop(k) = sum/(m*n) ;
end
for i = 1:m
    for j = 1:n
        for k = 1:(level-1)
            if img(i,j) > thresh(k) && img(i,j) < thresh(k + 1) 
                g_out(i,j) = img(i,j) * prop(k);
            end  
        end
    end
end
figure(1)
subplot(2,2,1),imshow(img),title('IN')
subplot(2,2,2),imshow(uint8(g_out)),title('OUT')