clc;
clear all;
close all;
a = im2double(imread('DIP_Original.tif'));
PSF = fspecial('motion', 88, 150);
blurred = imfilter(a,PSF, 'conv', 'circular');

b1 = imnoise(blurred, 'gaussian' , 0, 0.0001);

x1= 0.0001 / var(a(:));
x = deconvwnr(b1, PSF , x1);



subplot(1,3,1);
imshow(a);
title('Original');

subplot(1,3,2);
imshow(b1);
title('blurred');

subplot(1,3,3);
imshow(x);
title('corrected');