img = imread('123.jpg');
img = rgb2gray(img);
[m,n]=size(img);
g_out = zeros(m,n);
f_a = 10;%0-255
f_b = 200;%0-255
g_a = 20;%0-255
g_b = 40;%0-255
for i=1:m
    for j=1:n
        if img(i,j) < f_a
            g_out(i,j) =  g_a / f_a * img(i,j);
        end
        if img(i,j) > f_a && img(i,j) < f_b
            g_out(i,j) = (g_b - g_a) / (f_b - f_a) * (img(i,j)-f_a)+g_a;
        end
        if img(i,j) > f_b
            g_out(i,j) = (255-g_b) / (255-f_a) * (img(i,j)-f_b)+g_b;
        end
    end
end
figure(1)
subplot(2,2,1),imshow(img),title('IN')
subplot(2,2,2),imshow(g_out),title('OUT')