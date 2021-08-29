function [outputArg1,outputArg2] = hough_transform(img,title,peaks,NHoodSize)
%%%Standard Hough Transform (SHT) 
I=double(img);
[rr,cc]=size(I);

%%%Edge detection
BW = edge(I,'sobel');
figure,imshow(BW)
export_figure(gcf,strcat(title,'_edge_detect'))

%%%Hough transform
[H,T,R] = hough(BW);%H:   the Hough transform matrix;
                    %T,R: the values over which the Hough transform matrix
                    %was generated
figure,imagesc(H),colormap pink
export_figure(gcf,strcat(title,'_hough_tf'))

%%%Identify peaks in Hough transform
if NHoodSize
    P  = houghpeaks(H,peaks);%5 is  the maximum number of peaks to identify
                     %P  row and column coordinates of the peaks
else
    P  = houghpeaks(H,peaks,'NHoodSize',[21 21]);%5 is  the maximum number of peaks to identify
                     %P  row and column coordinates of the peaks
end

%H
figure,imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
colormap pink
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
%peaks
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','yellow');
export_figure(gcf,strcat(title,'_houghpeaks'))

%%%Compute straight lines and plot them
figure, imshow(BW), hold on
for k=1:length(P)
    if T(P(k,2))>-45 && T(P(k,2))<45
        x1=R(P(k,1))/cos(deg2rad(T(P(k,2)))) - 1*tan(deg2rad(T(P(k,2))));
        x2=R(P(k,1))/cos(deg2rad(T(P(k,2)))) - cc*tan(deg2rad(T(P(k,2))));
        plot([x1,x2],[1 cc],'LineWidth',2,'Color','yellow');
    else
        y1=R(P(k,1))/sin(deg2rad(T(P(k,2)))) - 1/tan(deg2rad(T(P(k,2))));
        y2=R(P(k,1))/sin(deg2rad(T(P(k,2)))) - rr/tan(deg2rad(T(P(k,2))));
        plot([1,rr],[y1 y2],'LineWidth',2,'Color','red');
    end
end
export_figure(gcf,strcat(title,'_img_with_lines'))

%%%Find line segments and plot them
lines = houghlines(BW,T,R,P,'FillGap',10,'MinLength',30);
figure, imshow(img), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end
export_figure(gcf,strcat(title,'_img_with_lines_begend'))



