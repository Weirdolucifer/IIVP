image1 = imread('lena.png')
image = im2bw(image1)
subplot(1, 2, 1)
imshow(image)
[x, y] = size(image)
ans = ones(x, y)
x = 20
y = 20
for i = 1:20
    for j = 1:20
        cnt = 0
        cnt1 = 0
        if(i+1 <= x)
            cnt = cnt+1
            if(image(i, j) == image(i+1, j))
                cnt1 = cnt1 + 1
            end
        end
        if(i-1 > 0)
            cnt = cnt+1
            if(image(i, j) == image(i-1, j))
                cnt1 = cnt1 + 1
            end
        end
        if(j-1 > 0)
            cnt = cnt+1
            if(image(i, j) == image(i, j-1))
                cnt1 = cnt1 + 1
            end
        end
        if(j+1 <= y)
            cnt = cnt+1
            if(image(i, j) == image(i, j+1))
                cnt1 = cnt1 + 1
            end
        end
        if(cnt == cnt1)
            ans(i, j) = 0
        else
            ans(i, j) = 1
        end
    end
end
ans1 = mat2gray(ans)
subplot(1, 2, 2)
imshow(ans1)