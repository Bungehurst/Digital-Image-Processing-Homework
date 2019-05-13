%imshow('E:\Desktop\DigitalImageProcessing\Task1\photos\2_100X99.bmp'),title('原始图像');
img = imread('E:\Desktop\DigitalImageProcessing\Task1\photos\2_100X99.bmp');
figure(1);
subplot(1,2,1);
imshow(img),title('原始图像');
% filename = strcat('2_100X99','.png');
% imwrite(img,filename,'png');
% filename = strcat('2_100X99','.gif');
% imwrite(img,filename,'gif');
% filename = strcat('2_100X99','.jpeg');
% imwrite(img,filename,'jpeg');
% filename = strcat('2_100X99','.tiff');
% imwrite(img,filename,'tiff');
% filename = strcat('2_100X99','.png');
% imwrite(img,filename,'png');

gray = mat2gray(img);
level = graythresh(gray);
a = im2bw(gray,level);
[m,n]=size(a);
% mark = zeros(m,n);
% mk = 1;
% mark = Fcc(m-1,n-1,a,mark,mk);
tmp=zeros(m,n);
label=1;
for i=2:m
    for j=2:n-1
        up_left=a(i-1,j-1);             %原图像当前像素周围四个像素
        up=a(i-1,j);
        up_right=a(i-1,j+1);
        left=a(i,j-1);
        cur=a(i,j);
        
        if cur==1
            if cur~=up_left && cur~=up &&cur~=up_right &&cur~=left      %当前和四周的都不一样，加新标签
                tmp(i,j)=label;
                link{label}=[];
                label=label+1;
            else
                t=sort([tmp(i,j-1) tmp(i-1,j-1) tmp(i-1,j) tmp(i-1,j+1)]);  %标签图像当前像素周围四个像素并排序         
                for k=1:4                   %寻找周围四个像素非零的最小值赋值给标签图像
                    if t(k)~=0
                        tmp(i,j)=t(k);
                        for w=k:4
                            link{t(w)}=union(t(k:4),link{t(w)});     %设置不相交集合                
                        end
                        break;
                    end
                end                  
            end           
        end
        
    end
end

figure(1);
subplot(1,2,2);
imshow(tmp),title('连通域');