function [] = task3_filter(img,title)
    %TASK3_FILTER Summary of this function goes here
    %   Detailed explanation goes here
    identity_filter(img,strcat(title,'_id'),7);
    shift_filter(img,strcat(title,'_shift'),7);
    blurring_filter(img,strcat(title,'_blurred'),7);
    sharpening_filter(img,strcat(title,'_sharp'),7);
end

