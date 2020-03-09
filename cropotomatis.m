clear all; close all; clc;
[x, rect]= imcrop(imread('1.JPEG'),[150 150 150 150]); %perintah untuk memotong citra dengan ukuran yang telah ditentukan
k=1; %nama citra pertama yang akan dipotong
for n=1:8 %panjang file yang akan diproses
i= imread(strcat(num2str(k),'.JPEG')); %membaca file yang akan diproses
crop= imcrop(i, rect); %perintah memotong citra
gray= rgb2gray(crop); %mengubah citra asli(rgb)ke citra grayscale 
kontras= imadjust(gray, stretchlim(gray),[]);%perintah untuk penajaman kontras
imwrite (kontras, strcat('A' ,num2str(n),'.JPEG'));%menyimpan citra baru hasil preprocessing
k=k+1; %perintah untuk kenaikan nama file secara berurutan
end