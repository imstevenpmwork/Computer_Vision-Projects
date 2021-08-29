classdef StereoImage
    % StereoImage
    % Class for getting all the details from the pair of stereopsis images
    
    properties
        path
        title
        img_left
        img_rigt
        points_left
        points_right
    end
    
    methods
        function obj = StereoImage(path,title)
            % Get images details
            obj.path        = path;
            obj.title       = title;
            obj.img_left    = imread(strcat(obj.path,'/',obj.title,'1.pgm'));
            obj.img_rigt    = imread(strcat(obj.path,'/',obj.title,'2.pgm'));
            obj.points_left = load(strcat(obj.path,'/',obj.title,'1.points'));
            obj.points_right= load(strcat(obj.path,'/',obj.title,'2.points'));
            
            %Plot images with points
            I=[obj.img_left obj.img_rigt];
            figure(1), imshow(I), hold on;
            plot(obj.points_left(:,1),obj.points_left(:,2),'rx', 'LineWidth',2.0);
            plot(obj.points_right(:,1)+size(obj.img_left,2),obj.points_right(:,2),'rx', 'LineWidth',2.0);
            saveas(gcf,strcat('output/',obj.title,'_LR_with_points.png'));
        end
        
        function P1 = getLeftPointsHomogeneous(obj)
            % Add a third row full of 1s to the set of points in the left
            % image
            P1 = [ obj.points_left' ; ones(1,length(obj.points_left)) ];
        end
        
        function P2 = getRightPointsHomogeneous(obj)
            % Add a third row full of 1s to the set of points in the left
            % image
            P2 = [ obj.points_right' ; ones(1,length(obj.points_right)) ];
        end
    end
end

