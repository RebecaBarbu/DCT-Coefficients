%% citire si extragere info
function [extracted_to_write] = read_from_header(fileName)
newFileName = strcat(fileName);
fid = fopen(newFileName, 'r');
new_data = fread(fid);
fclose(fid);

extracted_dim_array = new_data(end); %cate cifre are dimensiunea lui dim_array
extracted_array = new_data(end-extracted_dim_array:end-1)'; % extragere cifre ale lui dim_array

%% creare inapoi dim din vectoru de cifre
extracted_dim = 0;
for(i=extracted_dim_array:-1:1)
    extracted_dim = extracted_dim*10+extracted_array(1,i);
end

%% extragere to_write de la << end-(977+3+1)+1 : end-(3+1) >>
extracted_to_write = new_data(end-(extracted_dim+extracted_dim_array+1)+1:end-(extracted_dim_array+1));

%%


end