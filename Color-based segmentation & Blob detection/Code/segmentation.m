function [] = segmentation(img_hsv,img_rgb,img_titles_cropped,low_th,up_th,car)


    [rr,cc,~]=size(img_hsv);
    seg=zeros(rr,cc);
    mask=img_hsv(:,:,1) > low_th & img_hsv(:,:,1) < up_th;
    seg=logical(seg+mask);
    
    prop = regionprops(seg, 'Area', 'Centroid', 'BoundingBox' );
    areas=[prop.Area];
    
    [~,ib]=sort(areas,'descend');
    xc = floor(prop(ib(1)).Centroid(1));
    yc = floor(prop(ib(1)).Centroid(2));
    ul_corner_width=prop(ib(1)).BoundingBox;
    
    imshow(seg);
    hold on;
    plot(xc,yc,'*r');
    rectangle('Position',ul_corner_width,'EdgeColor',[1,0,0]);
    saveas(gcf,strcat('plots/','1_',img_titles_cropped,car,'_seg','.jpg'));
    
    imshow(img_rgb);
    plot(xc,yc,'*r');
    rectangle('Position',ul_corner_width,'EdgeColor',[1,0,0]);
    saveas(gcf,strcat('plots/','1_',img_titles_cropped,car,'_ident','.jpg'));

end