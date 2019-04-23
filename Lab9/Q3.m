A=imread('morphology.tif');
A=im2bw(A);

B=[1 1 0];

F=padarray(A,[0 1],1);

G=false(size(A));
for i=1:size(F,1)
    for j=1:size(F,2)-2
        L=F(i,j:j+2);
        K=find(B==1);
       if(L(K)==1)
        G(i,j)=1;
        end
    end
end


A=imcomplement(A);
B=[0 1 1];
C=padarray(A,[0 3]);
D=false(size(A));
for i=1:size(C,1)
    for j=1:size(C,2)-2
        D(i,j)=sum(B&C(i,j:j+2));
        D(i,j)= 1-D(i,j);
    end
end

subplot(1,2,1);
imshow(G);
title('A o B');

subplot(1,2,2);
imshow(D);
title('Ac o b^');
