function [corner1, corner2] = calc_corner_pixels(center, rect_size)
   corner1(1)=center(1)-rect_size(1)/2;
   corner2(1)=center(1)+rect_size(1)/2;
   corner1(2)=center(2)-rect_size(2)/2;
   corner2(2)=center(2)+rect_size(2)/2;
end

