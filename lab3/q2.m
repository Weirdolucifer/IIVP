clc;clear;
I0 = imread('barbara.png');
I = I0;


[height,width, numberOfColorChannels]=size(I0);
if numberOfColorChannels > 1
  disp(numberOfColorChannels);
  I = rgb2gray(I0);
end


subplot(1,3,1)
imshow(I)
title('Original Image');


[height,width]=size(I);
I2= I;
mask = [1,2,3,4,5,6];
for i=2:height-1
    for j=2:width-1
        mean =double (0);
        mask = [I(i-1,j-1),I(i-1,j),I(i-1,j+1),I(i,j-1),I(i,j),I(i,j+1),I(i+1,j-1),I(i+1,j),I(i+1,j+1)];
        mean = mask(1)/9.0+mask(2)/9.0+mask(3)/9.0+mask(4)/9.0+mask(5)/9.0+mask(6)/9.0+mask(7)/9.0+mask(8)/9.0+mask(9)/9.0;

        
        I2(i,j) = uint8(mean);
    end
end
subplot(1,3,2)
imshow(I2)
title('Average Image');

median = [1,2,3,4,5,6];
med =1;
for i=2:height-1
    for j=2:width-1
        mask = [I(i-1,j-1),I(i-1,j),I(i-1,j+1),I(i,j-1),I(i,j),I(i,j+1),I(i+1,j-1),I(i+1,j),I(i+1,j+1)];
        median = sort(mask);% mask(1)+mask(2)+mask(3)+mask(4)+mask(5)+mask(6));
        med = median(4);
        I2(i,j) = uint8(med);
    end
end

subplot(1,3,3)
imshow(I2)
title('Median Image');


