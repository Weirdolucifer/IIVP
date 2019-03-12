clc;clear;
I0 = imread('I.jpg');
I = I0;


[height,width, numberOfColorChannels]=size(I0);
if numberOfColorChannels > 1
  disp(numberOfColorChannels);
  I = rgb2gray(I0);
end

subplot(1,2,1)
imshow(I)
title('Original Image');

[height,width]=size(I);
I2= I;
filter = [1,2,3,4,5,6,7,8,9];
for i=2:height-1
    for j=2:width-1
        gauss =double (0);
        filter = [I(i-1,j-1),I(i-1,j),I(i-1,j+1),I(i,j-1),I(i,j),I(i,j+1),I(i+1,j-1),I(i+1,j),I(i+1,j+1)];
        gauss = filter(1)/16.0+(filter(2)*2)/16.0+filter(3)/16.0+(filter(4)*2)/16.0+(filter(5)*4)/16.0+(filter(6)*2)/16.0+filter(7)/16.0+(filter(8)*2)/16.0+filter(9)/16.0;

        
        I2(i,j) = uint8(gauss);
    end
end

subplot(1,2,2)
imshow(I2)
title('Gauss low pass filtered Image');


