function [patches] = define_patches(img_titles)
    
    img_titles_cropped = crop_titles(img_titles);

   % read second image to define patches
   img = imread(char(img_titles(2)));
   img = rgb2gray(img);
   saveimg(img,img_titles_cropped(2))
   
   %% Create four patches (Objects of self defined class imgpatch)
   patches(4) = imgpatch();
   
   %% Create patch of red car
   patches(1).title = 'red';
   patches(1).center =[730, 395];
   patches(1).psize = [100, 90]; 
  
   %% Create patches of dark car
   % They all have the same center point and same title, but differen sizes
   patches(2).title = 'dark';
   patches(2).center =[600, 390];
   patches(2).psize = [70, 35]; 
   
   patches(3) = patches(2);
   patches(3).psize = [90 45];
  
   patches(4) = patches(2);
   patches(4).psize = [120 60];
    
   %Create a lot of patches to compare computation times
   patches(5) = patches(2);
   patches(5).psize = [8 4];
   
   for i=6:50
   patches(i) = patches(2);
   patches(i).psize = [8 4] + patches(i-1).psize;
   end
   
   for i = 1:length(patches)
      patches(i) = patches(i).add_size_to_title();
      patches(i) = patches(i).create_patch(img); 
      saveimg(patches(i).patch,strcat('patch_',patches(i).title));
   end
   
end

