
function error = test(img, sh, features,Q)

   img = shuffle(img,sh);
   features_test = extract_features(img,Q);
   error = sum(sum(sqrt((features-features_test).^2)))/100;
end