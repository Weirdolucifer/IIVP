clc;clear;
org_img = imread('flower.jpg');
% negative point transformation

trans = org_img;
[m,n,o] = size(org_img);
for i=1:m
    for j=1:n
        for k=1:o
        trans(i,j,k) = 255 -org_img(i,j,k);
        end
    end
end
subplot(2,2,1);
imshow(trans);
title('Negative');
%imwrite(trans,'negative.jpg');

% log transformation
trans = double(org_img);
for i=1:m
    for j=1:n
        for k=1:o
        trans(i,j,k) = (0.1)*log10(double(1+org_img(i,j,k)));
        end
    end
end
subplot(2,2,2);
imshow(trans);
title('Log Transform');
%imwrite(trans,'log.jpg');

% inverse log transformation
trans = double(org_img);
for i=1:m
    for j=1:n
        for k=1:o
        trans(i,j,k) = (10.^(double(org_img(i,j,k)./0.1)))-1;
        end
    end
end
subplot(2,2,3);
imshow(trans);
title('Inverse log Transform');
%imwrite(trans,'inv-log.jpg');


% gaama transformation
trans = double(org_img);
c = 0.01;
gamma = 2;
for i=1:m
    for j=1:n
        for k=1:o
        trans(i,j,k) = c*(double(org_img(i,j,k)).^gamma);
        end
    end
end
subplot(2,2,4);
imshow(trans);
title('Gaama Transform');
%imwrite(trans,'gamma.jpg');