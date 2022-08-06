function [extracted_sh, extracted_prag, extracted_features] = extractInfo(extracted_to_write)
    
    data = extracted_to_write;
    % #########
    % extragere ======================================================
    % #########
    % prag
    extracted_dim_prag = data(1)';
    extracted_prag_array = data(2:2+extracted_dim_prag-1)';
    
    % sh
    extracted_sh = data(2+extracted_dim_prag:2+extracted_dim_prag+256-1)';
    
    % features
    extracted_features = data (2+extracted_dim_prag+256:end)';
    
    % ##########
    % prelucrare =====================================================
    % ##########
    % prelucrare prag
    extracted_prag = 0;
    for(i=extracted_dim_prag:-1:1)
        extracted_prag = extracted_prag*10+extracted_prag_array(1,i);
    end
    extracted_prag = extracted_prag/10^3;
    
    % prelucrare sh
    extracted_sh(find(extracted_sh == 0)) = 256;
    
    % prelucrare extracted_features
    extracted_sign_of_features = extracted_features(end/2+1:end);
    extracted_features = extracted_features(1:end/2);
    
    sign_of_features = 2*extracted_sign_of_features - 1;
    extracted_features = extracted_features .* sign_of_features;

end