%% MAIN PATHOLOGY ANALYSIS WITH CALIBRATION
I = imread('20P35 RCR 10X 2.png');

% --- CALIBRATION SECTION ---
% If the staining is different, update these numbers from the Color Thresholder App
% Format: [L_min, L_max; a_min, a_max; b_min, b_max]
new_red_lims = [15.0, 75.0; 45.0, 70.0; -60.0, 50.0]; 

% --- EXECUTION ---
% Run with standard values:
blood_mask = TissueSegmenter(I, 'red'); 

% OR Run with new calibration for this specific batch:
% blood_mask = TissueSegmenter(I, 'red', new_red_lims); 

% (Rest of your scoring logic remains the same...)