    %pemotongan
f=membukacitra; %membukacitra
if ndims(f)==3
    f=rgb2gray(f); %mengubah citra rgb menjadi grayscale
end;
a=1; %urutan potong citra
f=im2double(f); %mengubah image ke ukuran presisi
[x,y,P]=impixel(f); %pixel citra
ex=170;
ye=85;
for i= 1 : b;
    xmin=x(1)-(ex/2);
    if xmin<=0
        xmin=0;
    end
    ifxmin>(size(f,2)-ex)
        xmin=(size(f,2)-ex);
    end
    ymin=y(i)-(ye/2);
    if ymin<=0
        ymin=0;
    end
    if ymin>(size(f,1)-ye)
        ymin=(size(f,1)-ye);
    end
kotak=[xmin ymin (ex-1) (ye-1);
img=imcrop(f,kotak); %potong citra sesuai ukuran
close;
a=a+1;
id= num2str(a) %mengubah number to string
namafile=strcat(id, '.jpg');
imwrite(img,namafile,'jpg'); %menyimpan file gambar dipotong
end;


    

