clear all
close all
clc

addpath('./images/car/');
addpath('./images/dog/');
addpath('./images/flowers/');
addpath('./images/horse/');
addpath('./images/lena/');
addpath('./images/waterfall/');

fileName='lena_compr80_lumin10.jpg';
im = imread(fileName);
dim_img=128;
Q=30;
im = rgb2gray(im);
img = imresize(im,[dim_img,dim_img]);
[extracted_to_write] = read_from_header(fileName);

[extracted_sh, extracted_prag, extracted_features] = extractInfo(extracted_to_write);


error = test(img, extracted_sh, extracted_features,Q)

if abs(error) > extracted_prag
    disp('Pragul este: ');
    extracted_prag
    disp('Scorul calculat este: ');
    abs(error)
    disp('Imaginea a fost modificata');
else
    disp('Pragul este: ');
    extracted_prag
    disp('Scorul calculat este: ');
    abs(error)
    disp('Imaginea a fost comprimata sau rescalata');
end