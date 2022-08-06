%% prelucrat 
function write_in_header(dim_prag, prag_array, sh, features, sign_of_features, fileName)
to_write=uint8([dim_prag prag_array sh features sign_of_features]'); %vector coloana uint8

%% salvare dimensiuni ale vectorului to_write ; ex 977 -> [7 7 9]
dim = size(to_write,1);
cnt = 1; 
while(dim~=0)
   r = rem(dim,10);
   dim = floor(dim/10);
   array(cnt,1) = uint8(r);
   cnt = cnt+1;
end
% array 
dim_array = size(array,1);

%% citire + scriere

fid = fopen(fileName, 'r');
data = fread(fid);
fclose(fid);

data = [data' to_write' array' dim_array]'; %vector linie 
%[ ...
% info_imagine ...
% info_to_write ...
% info_dimensiune_to_write ...
% dimensiune_ca_vector_pt_info_dimensiune_to_write_pe_8_biti ...
% ]  

newFileName = strcat(fileName);
fid = fopen(newFileName, 'w');
fwrite(fid, data);
fclose(fid);

end