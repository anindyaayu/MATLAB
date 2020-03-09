f=rgb2gray(imread('1.jpg'));%mengambil citra dan grayscaling
figure(1); %menampilkan gambar

h = imrect(gca, [30 15 160 215]); %crop dalam bentuk rectangle dengan ukuran kotak yang telah ditentukan
position = wait(h); %kita bebas dalam menentukan wilayah yg akan di crop
hasil_crop = imcrop(original_image, position); %hasil crop disimpan

figure, imshow(hasil_crop); %menampilkan hasil crop
imwrite(hasil_crop,'FreeCrop.jpg'); %menyimpan gambar hasil crop