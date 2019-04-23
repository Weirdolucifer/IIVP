clc;
clear all;
close all;
a = imread('2.tif');
% subplot(1,3,1);
% imshow(a);
F = fft2(double(a));
% subplot(1,3,2);
% imshow(F);
[m,n] = size(F);
H = double(zeros(size(F)));
w = 1000;
wc = 1000000;
for i=1:m
    for j=1:n
        s = F(i,j);
        H(i,j) = (s.^2 + w.^2)/(s.^2 + wc*s + w.^2);
    end
end
% 
% subplot(1,3,3)
imtool(ifft2(H),[]);
