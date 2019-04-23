A=imread('morphology.tif');
A=im2bw(A);
%erosion
E=[1 1 0];
F=padarray(A,[0 1],1);
G=false(size(A));
for i=1:size(F,1)
    for j=1:size(F,2)-2
        L=F(i,j:j+2);
        K=find(E==1);
       if(L(K)==1)
        G(i,j)=1;
        end
    end
end

%dilation
B=[1 1 0];
C=padarray(A,[0 3]);
D=false(size(A));
for i=1:size(C,1)
    for j=1:size(C,2)-2
        D(i,j)=sum(B&C(i,j:j+2));
    end
end

%opening
B=[1 1 0];
C=padarray(G,[0 3]);
H=false(size(G));
for i=1:size(C,1)
    for j=1:size(C,2)-2
        H(i,j)=sum(B&C(i,j:j+2));
    end
end

%closing
E=[1 1 0];
F=padarray(D,[0 1],1);
I=false(size(D));
for i=1:size(F,1)
    for j=1:size(F,2)-2
        L=F(i,j:j+2);
        K=find(E==1);
       if(L(K)==1)
        I(i,j)=1;
        end
    end
end

subplot(1,5,1);
imshow(A);
title('Original');

subplot(1,5,2);
imshow(G);
title('Erosion');

subplot(1,5,3);
imshow(D);
title('Dilation');

subplot(1,5,4);
imshow(H);
title('Opening');

subplot(1,5,5);
imshow(I);
title('Closing');

