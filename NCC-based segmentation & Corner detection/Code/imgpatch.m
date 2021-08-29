classdef imgpatch 
    properties
        title
        center
        psize
        patch
        corr_time
    end
    
    methods
        function [obj] = imgpatch()
        end
        
        function [obj] = create_patch(obj, img)
            corner1(1)=floor(obj.center(1)-obj.psize(1)/2);
            corner2(1)=floor(obj.center(1)+obj.psize(1)/2);
            corner1(2)=floor(obj.center(2)-obj.psize(2)/2);
            corner2(2)=floor(obj.center(2)+obj.psize(2)/2);

            obj.patch = img(corner1(2):corner2(2), corner1(1):corner2(1)); 
            %figure, imagesc(obj.patch); colormap gray;
        end
        
        function [obj] = add_size_to_title(obj)
           obj.title = strcat(obj.title,'_', num2str(obj.psize(1)), '_',num2str(obj.psize(2))) ;
        end
    end
end

