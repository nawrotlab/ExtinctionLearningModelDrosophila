%Author: Magdalena Springer, magdalena.springer@uni-koeln.de
%Figure 1 in Springer et al (2020)
clear
h=figure('units','centimeter','position',[1,1,8.6,8.6]);
imshow('Scheme.tiff','InitialMagnification',100);

set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 8.6 8.6])
savefig(h,'Figure1.fig')
print -depsc2 -painters Figure1.eps