function filename = imtomatrix(image)
im=imread(image);
d=im2double(im);
s=size(d);
ans=[];
fid=fopen('1.txt','w');
for i=1:s(1)
    for j=1:s(2)
        fprintf(fid,dec2bin(im(i,j,1)));
        fprintf(fid,'\n');
        fprintf(fid,dec2bin(im(i,j,2)));
        fprintf(fid,'\n');
        fprintf(fid,dec2bin(im(i,j,3)));
        fprintf(fid,'\n');
    end
end
matrix=ans;
end
