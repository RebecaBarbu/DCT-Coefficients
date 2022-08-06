clear 
close all
clc

addpath('./images/car/');
addpath('./images/dog/');
addpath('./images/flowers/');
addpath('./images/horse/');
addpath('./images/lena/');
addpath('./images/waterfall/');
% citire imagine
fileName='lena.jpg';
I = imread(fileName);

Q = 30;
dim_img = 128;
% work on luminance component, rescale to 128*128
I = rgb2gray(I);

img = imresize(I,[dim_img,dim_img]);

sh = randperm(dim_img^2/64);
img = shuffle(img,sh);

features = extract_features(img,Q);

prag = compute_thr(dim_img, sh, features, Q, 'lena_50.jpg');


% generare semn pt features
sign_of_features_1 = sign(features); 
sign_of_features_1(find(features == 0)) = 1;
sign_of_features = uint8((1+sign_of_features_1)/2); %[-1 1] -> [0 1]. obs. Exista valori de 0 deci pun 1 in sign pe pozitiile respective

features_abs = uint8(abs(features));

% codare val maxima 256 in sh -> 0
sh_zero = sh;
sh_zero(find(sh_zero == 256)) = 0;
sh_zero = uint8(sh_zero);

% prag zecimal -> valoare intreaga. valoare intreaga -> vector de cifre pt transmitere
temp_prag = prag;
temp_prag = temp_prag*10^3;
cnt = 1;
while(temp_prag ~=0)
   r = rem(temp_prag,10);
   temp_prag = floor(temp_prag/10);
   prag_array(1,cnt) = uint8(r);
   cnt = cnt+1;
end

dim_prag = uint8(cnt-1);
%
% scriere + trimitere
write_in_header(dim_prag, prag_array, sh_zero, features_abs, sign_of_features , 'lena_compr80_lumin10.jpg');


 %% VERIFICARI
