clc;
clear;
image = imread('AE.jpg');

img_double = double(rgb2gray(image));

plane1 = mod(img_double, 2); 
plane2 = mod(floor(img_double/2), 2); 
plane3 = mod(floor(img_double/4), 2); 
plane4 = mod(floor(img_double/8), 2); 
plane5 = mod(floor(img_double/16), 2); 
plane6 = mod(floor(img_double/32), 2); 
plane7 = mod(floor(img_double/64), 2); 
plane8 = mod(floor(img_double/128), 2); 

subplot(2, 5, 1); 
imshow(rgb2gray(image)); 
title('Original Image'); 

% plotting binary image having extracted bit
subplot(2, 5, 2); 
imshow(plane1); 
title('Bit Plane 1'); 
subplot(2, 5, 3); 
imshow(plane2); 
title('Bit Plane 2'); 
subplot(2, 5, 4); 
imshow(plane3); 
title('Bit Plane 3'); 
subplot(2, 5, 5); 
imshow(plane4); 
title('Bit Plane 4'); 
subplot(2, 5, 6); 
imshow(plane5); 
title('Bit Plane 5'); 
subplot(2, 5, 7); 
imshow(plane6); 
title('Bit Plane 6'); 
subplot(2, 5, 8); 
imshow(plane7); 
title('Bit Plane 7'); 
subplot(2, 5, 9); 
imshow(plane8); 
title('Bit Plane 8'); 

% plotting recombined image
reconstructed = (2 * (2 * (2 * (2 * (2 * (2 * (2 * plane8 + plane7) + plane6) + plane5) + plane4) + plane3) + plane2) + plane1); 
subplot(2, 5, 10); 
imshow(uint8(reconstructed)); 
title('Recombined Image'); 
