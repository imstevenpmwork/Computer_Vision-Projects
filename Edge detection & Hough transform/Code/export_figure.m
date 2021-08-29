function [] = export_figure(fig,my_title)

plotpath = 'plots/';
%Create directory "plots" if they don't already exist
if ~exist(plotpath, 'dir')
   mkdir(plotpath)
end


set(fig,'Units','centimeters');
screenposition = get(gcf,'Position');
set(fig,...
    'PaperPosition',[0 0 screenposition(3:4)],...
    'PaperSize',[screenposition(3:4)]);
print(fig,strcat(plotpath,my_title,'.png'),'-dpng');
end

