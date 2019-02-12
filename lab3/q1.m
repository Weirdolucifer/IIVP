clc;clear;
I0 = imread('barbara.png');
I = I0;


[height,width, numberOfColorChannels]=size(I0);
if numberOfColorChannels > 1
  disp(numberOfColorChannels);
  I = rgb2gray(I0);
end


subplot(2,3,1)
imshow(I)
title('Original Image');

[height, width]=size(I);


NumPixel = zeros(1,256);
for i = 1:height
    for j = 1:width
        NumPixel( I(i,j) ) = NumPixel( I(i,j) ) + 1;
    end
end

%subplot(2,3,2)
%bar(NumPixel)
%title('NumPixel');

[height,width]=size(I);


ProbPixel = zeros(1,256);
for i = 1:256
    ProbPixel(i) = NumPixel(i) / (height * width * 1.0);
end

subplot(2,3,2)
bar(ProbPixel)
title('ProbPixel');

CumuPixel = zeros(1,256);
for i = 1:256
    if i == 1
        CumuPixel(i) = ProbPixel(i);
    else
        CumuPixel(i) = CumuPixel(i-1) + ProbPixel(i);
    end
end

subplot(2,3,3);
bar(CumuPixel)
title('CumulativePixel');

Map = zeros(1,256);
for i = 1:256
    Map(i) = uint8(255 * CumuPixel(i)+0.5);
end
for i = 1:height
    for j = 1:width
        I(i,j)=Map(I(i,j));
    end
end


subplot(2,3,4)
imshow(I)
title('New Image')


newp = [105,103,152,185,255];
newNumPixel = [200000,50000,5124,2457,4563];


newProbPixel = zeros(1,5);
for i = 1:5
    newProbPixel(i) = newNumPixel(i) / (262114 * 1.0);%(height * width * 1.0);
end

subplot(2,3,5);
bar(newProbPixel);
title('NewProbPixel');

newCumuPixel = zeros(1,5);
for i = 1:5
    if i == 1
        newCumuPixel(i) = newProbPixel(i);
    else
        newCumuPixel(i) = newCumuPixel(i-1) + newProbPixel(i);
    end
end

subplot(2,3,5);
bar(newCumuPixel)
title('CumulativePixel');

min = 10000;
loc = 0;

newMap = zeros(1,256);
subplot(2,3,6)
bar(newMap);
title('After cumulative')


for i = 1:256
    min=double(10000);
    loc = 0;
    for j = 1:5
        if (abs(double(CumuPixel(i)-newCumuPixel(j)))<min)
            min = abs(double(CumuPixel(i)-newCumuPixel(j)));
            loc = j;
        end

    end   
    newMap(i) = newp(loc);
        
end
subplot(2,3,6)
bar(newMap);
title('After First loop')


I2 = I;
for i = 1:height
    for j = 1:width
        I2(i,j)=newMap(I2(i,j));
    end
end

subplot(2,3,6)
imshow(I2);
title('Final')