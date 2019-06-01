clear;
clc;
% DCT TWO DEMENSION
M = round(rand(4)*100) ;% GE RANDOM MATRIX
T = zeros(4);
for i = 0:3
    for j = 0:3
        if i == 0
            a = sqrt(1/4);
        else
            a = sqrt(2/4);
        end            
         T(i+1,j+1) = a*cos(pi*(j+0.5)*i/4);
     end
end
O1 = T * M * T'     ; % DCT TRANSFER
R =  T' * O1 * T    ;  % ECT INVERSE TRANSFER
%zigzag serarch
O = zigzag(O1);
P = [0.1 0.2 0.3 0.4];
%Huffman Code 
%[q,d]=Huffman_code(P)


I = imread('timg.jpg');
I1 = rgb2gray(I);
[M,N] = size(I1);
[count,x] = imhist( I1 ) ;
I2 = I1(:);
prob = count/(M*N);
[m,n] = size(prob);
prob = reshape(prob,1,m*n);
%stem(x,count);
%[q,d]=Huffman_code(prob)
 k = 0:255;
 dict = huffmandict(k,prob); %生成字典
 enco = huffmanenco(I2,dict); %编码
 deco = huffmandeco(enco,dict); %解码
 Ide = col2im(deco,[M,N] ,[M,N] ,'distinct'); %把向量重新转换成图像块；
 subplot(1,2,1);imshow(I1),title('original image');
 subplot(1,2,2);imshow(uint8(Ide)),title('deco image');