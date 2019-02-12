image = imread('flower.jpg');
gray = rgb2gray(image);

freq = zeros(1,256);
[m,n] = size(gray);
for i=1:m
    for j=1:n
        freq(gray(i,j)+1) = freq(gray(i,j)+1)+1;
    end
end
subplot(1,3,1);
bar(freq);

count = zeros(1,256);
for i=1:256
    count(i) = freq(i)/(m*n);
end
subplot(1,3,2);
bar(count);

cumCount = zeros(1,256);
cumCount(1) = count(i);
for i=2:256
    cumCount(i) = cumCount(i-1) + count(i);
end
subplot(1,3,3);
bar(cumCount);




