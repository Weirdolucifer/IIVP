I = imread('lena.png');
I1 = I(: , end:-1:1 , :)
subplot(2,2,1), imshow(I)
subplot(2,2,2), imshow(I1)
I2 = [I I]
subplot(2,2,3), imshow(I2)
I3 = [I;I]
subplot(2,2,4), imshow(I3)