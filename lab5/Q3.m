f = imread('II.jpeg');
ffiw = ifft2(f);
ffiw = ffiw(2:size(f,1)-1,2:size(f,2)-1);
subplot(1,4,1);
imshow(ffi1, []);
title('image');

h = [1,0,-1,2,0,-2,1,0,-1];
PQ = size(f);
F = fft2(double(f),PQ(1),PQ(2));
H = fft2(double(h),PQ(1),PQ(2));
x = H.*F;
ffi1 = ifft2(x);
ffi1 = ffi1(2:size(f,1)-1,2:size(f,2)-1);


subplot(1,4,2);
imshow(ffi1, []);
title('vertical edge of the image');


f = imread('II.jpeg');
h = [1,2,1,0,0,0,-1,-2,-1];
PQ = size(f);
F = fft2(double(f),PQ(1),PQ(2));
H = fft2(double(h),PQ(1),PQ(2));
x = H.*F;
ffi2 = ifft2(x);
ffi2 = ffi2(2:size(f,1)-1,2:size(f,2)-1);

subplot(1,4,3);
imshow(ffi2, []);
title('horizontal edge of the image');

ffi = ffi1+ffi2;
subplot(1,4,4);
imshow(ffi, []);
title('sum of the image');

