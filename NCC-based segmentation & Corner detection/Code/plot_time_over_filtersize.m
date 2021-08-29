function [npixels,median_time_correlation] = plot_time_over_filtersize(patches)
    figure('visible','on'); hold on;
    npixels = [];
    patchsize = [];
    median_time_correlation = [];
for patch = patches
    npixels = [npixels patch.psize(1)*patch.psize(2)];
    patchsize = [patchsize patch.psize(1)];
    median_time_correlation = [median_time_correlation median(patch.corr_time)];
end    
    figure; plot(patchsize,median_time_correlation, 'rx'); xlabel('width of filter [px]'); ylabel('Duration of NCC [s]');
    saveas(gcf,'plots/time_over_filtersize.jpg');
end

