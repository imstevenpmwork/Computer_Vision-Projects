function [] = task4_fft(img,title)
%TASK4_FFT
    
%% Displays the log of the FFT images
    % Applies the FFT on the image
    img_fft=fft2(img);
    
    % Gets the magnitude of the FFT image
    img_fft_mod=abs(img_fft);
    
    % Displays the magnitude of the FFT image
    dispAndSaveFig(log(fftshift(img_fft_mod)), strcat(title,'_ftt_log'), false, false);
    
 %% Displays the log of the low-pass Gaussian filter
    % Creates a gaussian filter of 101px and sigma=5
    H = fspecial('gaussian', 101, 5);
    
    % Applies the FFT on the gaussian filter
    H_fft=fft2(H);
    
    % Gets the magnitude of the FFT gaussian filter
    H_fft_mod=abs(H_fft);
    
    % Displays the magnitude of the FFT Gaussian filter
    dispAndSaveFig(log(fftshift(H_fft_mod)),'4_Gaussian_Filter_ftt_log', false, true);
    
%% Displays the log of the sharpening filter images
    % Creates the sharpening filter
     K1 = zeros(7);
     K1(4,4) = 2;
     K2 = ones(7)/(49);
     K = K1 - K2;
     
     F=zeros(101);
     F(48:54,48:54)=K;
     
     % Applies the FFT on the sharpening filter
     F_fft=fft2(F);
     
     % Gets the magnitude of the FFT sharpening filter
     F_fft_mod=abs(F_fft);
     
     % Displays the magnitude of the FFT sharpening filter
     dispAndSaveFig(log(fftshift(F_fft_mod)),'4_Sharpening_Filter_ftt_log', false, true);
     
end

