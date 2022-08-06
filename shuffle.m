function im = shuffle(img, sh)

N = length(sh)/sqrt(length(sh));
index=1;
im = zeros(size(img,1),size(img,2));
for i=1:8:size(img,1)
    for j=1:8:size(img,2)
        if(mod(sh(index),N)==0)
            Linie=sh(index)/N;
            Coloana=N;
        else
            Linie = floor(sh(index)/N)+1;
            Coloana = mod(sh(index),N);
        end
        if Linie==1 && Coloana==1
            im(Linie:Linie+7,Coloana:Coloana+7) = img(i:i+7,j:j+7);
        else
            if Linie==1
                im(Linie:Linie+7,8*Coloana-7:8*Coloana) = img(i:i+7,j:j+7);
            
            else
                if Coloana==1
                    im(8*Linie-7:8*Linie,Coloana:Coloana+7) = img(i:i+7,j:j+7);
                else
                    im(8*Linie-7:8*Linie,8*Coloana-7:8*Coloana) = img(i:i+7,j:j+7);
                end
            end
        end
        index=index+1;
    end
end
end