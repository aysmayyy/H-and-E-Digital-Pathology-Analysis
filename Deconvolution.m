function [H, E] = Deconvolution(rgbimage)   
    % Separate H&E stains using Optical Density Matrix Inversion
    
    % Standard OD values for Hematoxylin, Eosin, and DAB
    He = [0.18; 0.20; 0.08];
    Eo = [0.01; 0.13; 0.01];
    DAB = [0.10; 0.21; 0.29];
    
    % Normalize OD matrix
    hed2rgb = [He/norm(He) Eo/norm(Eo) DAB/norm(DAB)]';
    rgb2hed = inv(hed2rgb); 
    
    % Convert to double and add 1 to avoid log(0)
    rgbimage = double(rgbimage) + 1;
    OD = -log(rgbimage);
    
    % Unmix stains
    [r, c, ~] = size(rgbimage);
    DCop = reshape(reshape(OD, [], 3) * rgb2hed, r, c, 3);
    
    % Reconstruct Channels
    H = DCop(:,:,1);
    E = DCop(:,:,2);
end