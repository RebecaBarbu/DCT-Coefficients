function features = extract_features(im, Q)


quantization_matrix = quant(Q);
c = zeros(size(im,1),size(im,2));
for i=1:8:size(im,1)
    for j=1:8:size(im,2)
         c(i:i+7,j:j+7) = dct2(im(i:i+7,j:j+7));
         c(i:i+7,j:j+7) = round(c(i:i+7,j:j+7)./quantization_matrix);
    end
end

% keep the difference between 2 coefficients from 2 consecutive blocks
k=1;
for i=1:8:size(c,1)
    x = c(i:i+7,1:7);
    for j =9:8:size(c,2)
        diff_to_keep(k) = x(1,2)-c(i,j+1);
        diff_to_keep(k+1) = x(2,1)-c(i+1,j);
        diff_to_keep(k+2) = x(1,3)-c(i,j+2);
        
        x = c(i:i+7,j:j+7);
        k=k+3;
    end
end

features = diff_to_keep;
end