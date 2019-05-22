img = imread('123.jpg');
img = rgb2gray(img);
img_noise = imnoise(img,'salt & pepper',0.05); 
[m,n] = size(img_noise);
%低通滤波卷积核
core = 0.5*  [1 1 1;
              1 1 1;
              1 1 1];

%图像锐化          
% core =       [-1 -1 -1;
%               -1 9 -1;
%               -1 -1 -1];

%高通滤波卷积核
% core =  [0 -1 0;
%          -1 5 -1;
%          0 -1 0];      


%边缘检测卷积核
% core =  [-1 0 -1;
%           0 4 0;
%          -1 0 -1];       


%扩增
img_arg = zeros(m+2,n+2);
[x,y] = size(img_arg);
img_out = zeros(x,y);
for i=1:m
    for j=1:n
        img_arg(i+1,j+1) = img_noise(i,j);
    end
end

%通用卷积
% for i=2:1:x-1
%     for j=2:1:y-1
%         img_out(i,j) = (img_arg(i-1,j-1)*core(1,1)+img_arg(i-1,j)*core(1,2)+img_arg(i-1,j+1)*core(1,3)+img_arg(i,j-1)*core(2,1)+img_arg(i,j)*core(2,2)+img_arg(i,j+1)*core(2,3)+img_arg(i+1,j-1)*core(3,1)+img_arg(i+1,j)*core(3,2)+img_arg(i+1,j+1)*core(3,3))/9;
%     end
% end

%中值滤波
% for i=2:1:x-1
%     for j=2:1:y-1
%         a = [img_arg(i-1,j-1) img_arg(i-1,j) img_arg(i-1,j+1) img_arg(i,j-1) img_arg(i,j) img_arg(i,j+1) img_arg(i+1,j-1) img_arg(i+1,j) img_arg(i+1,j+1)];
%         a = sort(a);
%         img_out(i,j) = a(5);
%     end
% end

%高斯滤波
sigma = 2;
sum = gos(-1,-1,sigma)+gos(-1,0,sigma)+gos(-1,1,sigma)+gos(0,-1,sigma)+gos(0,0,sigma)+gos(0,1,sigma)+gos(1,-1,sigma)+gos(1,0,sigma)+gos(1,1,sigma);
for i=2:1:x-1
    for j=2:1:y-1
        img_out(i,j) = (img_arg(i-1,j-1)*gos(-1,-1,sigma)+img_arg(i-1,j)*gos(-1,0,sigma)+img_arg(i-1,j+1)*gos(-1,1,sigma)+img_arg(i,j-1)*gos(0,-1,sigma)+img_arg(i,j)*gos(0,0,sigma)+img_arg(i,j+1)*gos(0,1,sigma)+img_arg(i+1,j-1)*gos(1,-1,sigma)+img_arg(i+1,j)*gos(1,0,sigma)+img_arg(i+1,j+1)*gos(1,1,sigma))/sum;
    end
end

figure(1)
subplot(2,3,1),imshow(img),title('原始图像')
subplot(2,3,2),imshow(img_noise),title('加入椒盐噪声的图像')
subplot(2,3,3),imshow(uint8(img_out)),title('OUT图像')