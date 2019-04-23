clc;
clear all;
close all;
a = imread('1.tif');

F = fft2(double(a)); % calculated fft
[m,n] = size(F);
H = double(zeros(size(a)));
G = double(zeros(size(a)));
R = double(zeros(size(a)));
for u=1:m
    for v=1:n
        H(u,v) = (1/(pi*(u+v)))*sin(pi*((u+v)/1))*exp(-1i*pi*((u+v)/1));
%         H(u,v) = (10/(pi*(u+v)))*sin(pi*((u+v)/10))*exp(-1i*((u+v)/10));
        G(u,v) = H(u,v)*F(u,v);
        R(u,v) = G(u,v)*(H(u,v).^(-1));
    end
end
% R = a;
ans = double(ifft2(G));
subplot(1,3,2)
imtool(ans,[]);
subplot(1,3,1)
imtool(a);
subplot(1,3,3);
imshow(ifft2(R));


   
        