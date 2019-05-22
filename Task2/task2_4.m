img = imread('123.jpg');
img = rgb2gray(img);
I = double(img);
[m,n] = size(I);
img_out = zeros(m,n,3);
L = 255;
R = zeros(m,n);
G = zeros(m,n);
B = zeros(m,n);
for i=1:m
    for j=1:n
        if I(i,j) <= L/3
            R(i,j) = 0;
            G(i,j) = 5*I(i,j);
            B(i,j) = L;
        else if I(i,j) <= 2*L/3
            R(i,j) = 5*I(i,j);
            G(i,j) = L;
            B(i,j) = -5*I(i,j)+2*L/3;
        else
            R(i,j) = L;
            G(i,j) = -5*I(i,j)+3*L;
            B(i,j) = 0;
            end
            end
        end
end
for i=1:m
    for j=1:n
        img_out(i,j,1) = R(i,j);
        img_out(i,j,2) = G(i,j);
        img_out(i,j,3) = B(i,j);
    end
end

img_out = img_out/L;
figure(1)
subplot(2,2,1),imshow(img),title('Ô­Ê¼Í¼Ïñ')
subplot(2,2,2),imshow(img_out),title('OUTÍ¼Ïñ')