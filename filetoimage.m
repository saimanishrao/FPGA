function image=filetoimage(filename)
fid=fopen(filename,'r');
M=fscanf(fid,'%d');
s=size(M)/3;
siz=sqrt(s(1));
im(:,:,1)=[1];
im(:,:,2)=[1];
im(:,:,3)=[1];
count=1;
for i =1:siz
    for j=1:siz
        im(i,j,1)=M(count);
        im(i,j,2)=M(count+1);
        im(i,j,3)=M(count+2);
        count=count+3;
    end
end
image=im;
imshow(uint8(image));
end