function [LR_value, C_scale]= characteristic_scale_graph(img,number_scales,initial_sigma,rate_sigma_mult,rate_sigma_sum)

LR_value= zeros(1,2);
C_scale= zeros(1,2);

[h,w]=size(img);

sigma=initial_sigma;
n=number_scales;
scale_space = zeros(h,w,n);

for ii=1:n
    filt_size =  2*ceil(3*sigma)+1; % filter size
    LoG       =  sigma^2 * fspecial('log', filt_size, sigma); %scale-normalized Laplacian of Gaussian filter
    imFiltered = imfilter(img, LoG, 'same', 'replicate');
    scale_space(:,:,ii)=abs(imFiltered);
    
    radii(ii)=sigma;
    sigma=rate_sigma_mult*sigma+rate_sigma_sum;
end

%non-maxima suppression in scale-space
v=1;
vv=-v:v;
scale_space_nomax  = zeros(h,w,n);
for ii=1:n
    TMP=scale_space(:,:,ii);
    for hh=(1+v):1*v:(h-v)
        for ww=(1+v):1*v:(w-v) %non-maxima suppression in 2D spatial slice @fixed scale
            tmp=TMP(hh+vv,ww+vv);
            [m,i]=max(tmp(:));
            a=zeros(length(vv));
            if m>55, a(i)=m;end
            TMP(hh+vv,ww+vv)=a;
            scale_space_nomax(hh+vv,ww+vv,ii)=a;
        end
    end
    v=v+1;
    vv=-v:v;
end


LF_laplacian_response_value=zeros(1,10);
RF_laplacian_response_value=zeros(1,10);

for iii=1:n
    
    [i,j,v]=find(scale_space_nomax(348:375,152:180,iii));
    
    if (isempty(v))
        v=0;
    end
    
    LF_laplacian_response_value(1,iii)=max(v);
    
    [i,j,v]=find(scale_space_nomax(358:410,432:482,iii));
    
    if (isempty(v))
        v=0;
    end
    
    RF_laplacian_response_value(1,iii)=max(v);
    
end

[value,index]=max(LF_laplacian_response_value);
LR_value(1)=value;
C_scale(1)=radii(index);

[value,index]=max(RF_laplacian_response_value);
LR_value(2)=value;
C_scale(2)=radii(index);

close all;

plot(radii,LF_laplacian_response_value,'*-');
title('Characteristic Scale Graph for Left Flower')
xlabel('Scale of Filter') 
ylabel('Laplacian Response') 
saveas(gcf,strcat('plots/','2_sunflowers_left_Laplacian_Response_Characteristic_Scale','.jpg'));

figure, plot(radii,RF_laplacian_response_value,'*-');
title('Characteristic Scale Graph for Right Flower')
xlabel('Scale of Filter') 
ylabel('Laplacian Response') 
saveas(gcf,strcat('plots/','2_sunflowers_right_Laplacian_Response_Characteristic_Scale','.jpg'));
