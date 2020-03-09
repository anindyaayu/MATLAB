f=rgb2gray(imread('2.jpg'));%mengambil citra dan grayscaling
dim=200;%inisialisasi ukuran crop
figure(2);%menampilkan citra
[c,r,p]=impixel(f);%menentukan titik crop pada citra
close(figure(1));%mengeluarkan tampilan citra
FN50=uint8(zeros(dim,dim,length(c)));%mengosongkan variabel FN50
fc=imcrop(f,[c, r, dim-1, dim-1]);%perintah crop sesuai ukuran crop
FN50(:,:,1)=fc;%mengisi variabel FN50 dengan variabel fc
