

clc;clear;
I0 = imread('II.jpeg');
I = I0;


[height,width, numberOfColorChannels]=size(I0);
if numberOfColorChannels > 1
  disp(numberOfColorChannels);
  I = rgb2gray(I0);
end

subplot(1,3,1)
imshow(I)
title('Original Image');
Ix =  [1,2,1,0,0,0,-1,-2,-1];

[height,width]=size(I);
I2= I;
filter = [1,2,3,4,5,6,7,8,9];
for i=2:height-1
    for j=2:width-1
        hori =double (0);
        filter = [I(i-1,j-1),I(i-1,j),I(i-1,j+1),I(i,j-1),I(i,j),I(i,j+1),I(i+1,j-1),I(i+1,j),I(i+1,j+1)];
        hori = filter(1)*Ix(9)+filter(2)*Ix(8)+filter(3)*Ix(7)+filter(4)*Ix(6)+filter(5)*Ix(5)+filter(6)*Ix(4)+filter(7)*Ix(3)+filter(8)*Ix(2)+filter(9)*Ix(1);

        
        I2(i,j) = uint8(hori);
    end
end

subplot(1,3,2)
imshow(I2)
title('horizontal edge of the image');

Iq =  [1,0,-1,2,0,-2,1,0,-1];
I3= I;
filter = [1,2,3,4,5,6,7,8,9];
for i=2:height-1
    for j=2:width-1
        ver =double (0);
        filter = [I(i-1,j-1),I(i-1,j),I(i-1,j+1),I(i,j-1),I(i,j),I(i,j+1),I(i+1,j-1),I(i+1,j),I(i+1,j+1)];
        ver = filter(1)*Iq(9)+filter(3)*Iq(7)+filter(4)*Iq(6)+filter(6)*Iq(4)+filter(7)*Iq(3)+filter(9)*Iq(1);

        
        I3(i,j) = uint8(ver);
    end
end

subplot(1,3,3)
imshow(I3)
title('vertical edge of the image');

