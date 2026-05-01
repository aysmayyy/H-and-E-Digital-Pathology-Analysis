function BW = TissueSegmenter(RGB, type, customLims)
    % Multi-mode segmenter: Uses standard research thresholds or custom calibration
    I = rgb2lab(RGB);
    
    % If no custom limits are provided, use your original study thresholds
    if nargin < 3
        switch lower(type)
            case 'red' 
                lims = [10.157, 81.724; 49.340, 64.147; -73.321, 56.994];
            case 'purple'
                lims = [6.886, 45.363; -16.672, 24.068; -54.461, -12.947];
            case 'white'
                lims = [68.449, 98.846; -29.639, 11.887; -19.097, 11.808];
            case 'tissue'
                lims = [6.886, 59.407; -32.389, 81.828; -73.321, 56.994];
        end
    else
        lims = customLims; % Use the values you just found in the Thresholder app
    end
    
    % Apply the thresholds
    BW = (I(:,:,1) >= lims(1,1) & I(:,:,1) <= lims(1,2)) & ...
         (I(:,:,2) >= lims(2,1) & I(:,:,2) <= lims(2,2)) & ...
         (I(:,:,3) >= lims(3,1) & I(:,:,3) <= lims(3,2));
end