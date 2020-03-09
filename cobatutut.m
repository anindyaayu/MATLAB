% inisialisasi data citra yang telah diambil
% format citra adalah .jpg
srcFile=dir(fullfile('D:\TUGAS AKHIR\TUGAS AKHIR FIX\*.jpg'));
for i=1:length(srcFile) % panjang file yang akan di proses
filename=strcat('D:\TUGAS AKHIR\TUGAS AKHIR FIX\',srcFile(i).name); % inisialisasi nama file
I=imread(filename); % membaca file yang akan diproses
crop=imcrop(I); % perintah memotong citra
close;
path=strcat('D:\TUGAS AKHIR\TUGAS AKHIR FIX\CROP\',srcFile(i).name); % inisialisasi nama citra baru
imwrite(crop,path);% menyimpan citra baru setelah dipotong
end