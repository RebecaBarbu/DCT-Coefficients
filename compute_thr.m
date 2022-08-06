function prag = compute_thr(dim_img, sh, features, Q, filename)
    addpath('./images/car/');
    addpath('./images/dog/');
    addpath('./images/flowers/');
    addpath('./images/horse/');
    addpath('./images/lena/');
    addpath('./images/waterfall/');
    im=imread(filename);
    im = rgb2gray(im);
    im = imresize(im,[dim_img,dim_img]);
    prag = test(im,sh,features,Q);
end