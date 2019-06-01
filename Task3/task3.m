img = imread('timg.jpg');
img = rgb2gray(img);
img = double(img);
[m,n] = size(img);
%����Ҷ�任
F_img = fft2(img); 
%Ƶ����� = ʱ����

%����Ҷ���任
g = real(ifft2(F_img)); 
%��Ե�������
% core =       [0 -1 0;
%               -1 4 -1;
%               0 -1 0];     
% core =      6* [-1 -1 -1;
%               -1 8 -1;
%               -1 -1 -1];    
core =      6* [-1 0 1;
              -2 0 2;
              -1 0 1];    
%����
img_arg = zeros(m+2,n+2);
[x,y] = size(img_arg);
img_out = zeros(x,y);
for i=1:m
    for j=1:n
        img_arg(i+1,j+1) = img(i,j);
    end
end

%ͨ�þ��
for i=2:1:x-1
    for j=2:1:y-1
        img_out(i,j) = (img_arg(i-1,j-1)*core(1,1)+img_arg(i-1,j)*core(1,2)+img_arg(i-1,j+1)*core(1,3)+img_arg(i,j-1)*core(2,1)+img_arg(i,j)*core(2,2)+img_arg(i,j+1)*core(2,3)+img_arg(i+1,j-1)*core(3,1)+img_arg(i+1,j)*core(3,2)+img_arg(i+1,j+1)*core(3,3))/9;
    end
end
core =      6* [1 2 1;
                0 0 0;
                -1 -2 -1];  
for i=2:1:x-1
    for j=2:1:y-1
        img_out(i,j) = (img_arg(i-1,j-1)*core(1,1)+img_arg(i-1,j)*core(1,2)+img_arg(i-1,j+1)*core(1,3)+img_arg(i,j-1)*core(2,1)+img_arg(i,j)*core(2,2)+img_arg(i,j+1)*core(2,3)+img_arg(i+1,j-1)*core(3,1)+img_arg(i+1,j)*core(3,2)+img_arg(i+1,j+1)*core(3,3))/9;
    end
end
figure(1)
imshow(uint8(img)),title('ԭʼͼ��')
figure(2)
imshow(uint8(img_out)),title('OUTͼ��')
figure(3)
imshow(uint8(g)),title('FFT')