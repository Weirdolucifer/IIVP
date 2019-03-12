clc;clear;
A = rgb2gray(imread('III.jpg'));
subplot(1,3,1);
imshow(A);
title('Image');
I = double(A);

sizex = 1;
[height,width] = size(I);
[x,y]=meshgrid(-sizex:sizex,-sizex:sizex);

filtersizeX = size(x,1)-1;
filtersizeY = size(y,1)-1;

% First filter
fi = 1;
p = -(x.^2+y.^2)/(2*fi*fi);
output1 = exp(p)/(2*pi*fi*fi);

z1 = zeros(size(I));
PaddedImage1 = padarray(I,[sizex sizex]);

for i = 1:height
    for j =1:width
        J = PaddedImage1(i:i+filtersizeX,j:j+filtersizeY).*output1;
        z1(i,j)=sum(J(:));
    end
end

% Second filter
sc = 1;
p = -(x.^2+y.^2)/(2*sc*sc);
output2 = exp(p)/(2*pi*sc*sc);

z2 = zeros(size(I));
PaddedImage2 = padarray(I,[sizex sizex]);

for i = 1:height
    for j =1:width
        J = PaddedImage2(i:i+filtersizeX,j:j+filtersizeY).*output2;
        z2(i,j)=sum(J(:));
    end
end

result1 = z2;

result1 = uint8(result1);
subplot(1,3,2);
imshow(result1);
title('G1-G2');




