clear;
clc;
% DCT TWO DEMENSION
M = round(rand(4)*100) % GE RANDOM MATRIX
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
O1 = T * M * T'       % DCT TRANSFER
R =  T' * O1 * T    ;  % ECT INVERSE TRANSFER
%zigzag serarch
O = zigzag(O1)
