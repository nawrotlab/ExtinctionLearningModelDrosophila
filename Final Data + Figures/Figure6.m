%Author: Magdalena Springer, magdalena.springer@uni-koeln.de
%Figure 6 in Springer et al (2020)

clear
load('ShibirePubAppN')
load('ShibirePubAvN')

%calculate Standard Deviations
SEM_A = std(A,[],1); 
SEM_B = std(B,[],1);

%calculate significances
p2 = ranksum(A(:,3),A(:,7));
[txta1] = CalcSign(p2);
p2 = ranksum(A(:,3),A(:,11));
[txta2] = CalcSign(p2);
p2 = ranksum(A(:,3),A(:,15));
[txta3] = CalcSign(p2);
p2 = ranksum(A(:,3),A(:,19));
[txta4] = CalcSign(p2);
p2 = ranksum(A(:,3),A(:,23));
[txta5] = CalcSign(p2);
p2 = ranksum(A(:,3),A(:,27));
[txta6] = CalcSign(p2);
p2 = ranksum(A(:,3),A(:,31));
[txta7] = CalcSign(p2);
p2 = ranksum(A(:,3),A(:,35));
[txta8] = CalcSign(p2);

p2 = ranksum(B(:,3),B(:,7));
[txtb1] = CalcSign(p2);
p2 = ranksum(B(:,3),B(:,11));
[txtb2] = CalcSign(p2);
p2 = ranksum(B(:,3),B(:,15));
[txtb3] = CalcSign(p2);
p2 = ranksum(B(:,3),B(:,19));
[txtb4] = CalcSign(p2);
p2 = ranksum(B(:,3),B(:,23));
[txtb5] = CalcSign(p2);
p2 = ranksum(B(:,3),B(:,27));
[txtb6] = CalcSign(p2);
p2 = ranksum(B(:,3),B(:,31));
[txtb7] = CalcSign(p2);
p2 = ranksum(B(:,3),B(:,35));
[txtb8] = CalcSign(p2);

%Plot Figure
h=figure('units','centimeter','position',[20,9,17.2,14]);
subplot(2,1,2,'units','centimeter','position',[1.5,1,15,5.5]);
b=bar(mean(A(:,[1 3 7 11 15 19 23 27 31 35])),'FaceColor','flat');
hold on
b.CData(1,:) = [0.7 0.7 0.7];
b.CData(2,:) = [0.3 0.3 0.3];
b.CData(3,:) = [0.25 0.83 0.56];
b.CData(4,:) = [1 0.39 0.42];
b.CData(5,:) = [0.89 0.475 0.733];
b.CData(6,:) = [0.89 0.475 0.733];
b.CData(7,:) = [0.541 0.655 0.827];
b.CData(8,:) = [0.541 0.655 0.827];
b.CData(9,:) = [0.8 0.8 0.8];
b.CData(10,:) = [0.8 0.8 0.8];
ylim([-0.8 0])
xlim([0.5 10.5])
set(gca,'YTick',[-0.6 -0.4 -0.2 0],'YTickLabel',{'-0.6','-0.4','-0.2','0'},'FontSize',8);
set(gca,'XTick',[1:10],'XTickLabel',{'Absolute','Extinction','PAM','PPL1','M6','MV2','V2','MVP2','KC(100%)','KC(50%)'},'FontSize',8);
title('Aversive Conditioning','FontSize',12);
annotation('textbox',[0.01,0.46,0.06,0.05],'String','B','EdgeColor','None','FontSize',12,'FontWeight','bold');
ylabel('Performance Index','FontSize',10);
yvalues = [1:10]
errorbar(yvalues,mean(A(:,[1 3 7 11 15 19 23 27 31 35])),SEM_A([1 3 7 11 15 19 23 27 31 35]),SEM_A([1 3 7 11 15 19 23 27 31 35]),'LineStyle','none','LineWidth',1,'CapSize',10,'Color','k');
yt = get(gca, 'YTick');
xt = get(gca, 'XTick');
plot(xt([2 3]), [1 1]*-0.35, '-k')
text(mean(xt([2 3])),-0.32,txta1,'FontSize',8,'FontWeight','bold')
plot(xt([2 4]), [1 1]*-0.41, '-k')
text(mean(xt([2 4])),-0.38,txta2,'FontSize',8,'FontWeight','bold')
plot(xt([2 5]), [1 1]*-0.47, '-k')
text(mean(xt([2 5])),-0.44,txta3,'FontSize',8,'FontWeight','bold')
plot(xt([2 6]), [1 1]*-0.53, '-k')
text(mean(xt([2 6])),-0.50,txta4,'FontSize',8,'FontWeight','bold')
plot(xt([2 7]), [1 1]*-0.59, '-k')
text(mean(xt([2 7])),-0.56,txta5,'FontSize',8,'FontWeight','bold')
plot(xt([2 8]), [1 1]*-0.65, '-k')
text(mean(xt([2 8])),-0.62,txta6,'FontSize',8,'FontWeight','bold')
plot(xt([2 9]), [1 1]*-0.71, '-k')
text(mean(xt([2 9])),-0.68,txta7,'FontSize',8,'FontWeight','bold')
plot(xt([2 10]), [1 1]*-0.77, '-k')
text(mean(xt([2 10])),-0.74,txta8,'FontSize',8,'FontWeight','bold')

annot = 'Neurons blocked during reactivation'
text(5,-0.91,annot,'FontSize',8)
xl = [0.3 0.92];
yl = [0.032 0.032];
annotation('line',xl,yl);

hold off
yvalues = [1:10]
subplot(2,1,1,'units','centimeter','position',[1.5,7.5,15,5.5]);
b=bar(mean(B(:,[1 3 7 11 15 19 23 27 31 35])),'FaceColor','flat');
hold on 
b.CData(1,:) = [0.7 0.7 0.7];
b.CData(2,:) = [0.3 0.3 0.3];
b.CData(3,:) = [0.25 0.83 0.56];
b.CData(4,:) = [1 0.39 0.42];
b.CData(5,:) = [0.89 0.475 0.733];
b.CData(6,:) = [0.89 0.475 0.733];
b.CData(7,:) = [0.541 0.655 0.827];
b.CData(8,:) = [0.541 0.655 0.827];
b.CData(9,:) = [0.8 0.8 0.8];
b.CData(10,:) = [0.8 0.8 0.8];

set(gca,'XTick',[1:10],'XTickLabel',{[]});
set(gca,'YTick',[0, 0.2 0.4 0.6],'YTickLabel',{'0','0.2','0.4','0.6'},'FontSize',8);
ylim([0 0.8])
ylabel('Performance Index','FontSize',10);
xlim([0.5 10.5])
title('Appetitive Conditioning','FontSize',12);
annotation('textbox',[0.01,0.93,0.06,0.05],'String','A','EdgeColor','None','FontSize',12,'FontWeight','bold');
errorbar(yvalues,mean(B(:,[1 3 7 11 15 19 23 27 31 35])),SEM_B([1 3 7 11 15 19 23 27 31 35]),SEM_B([1 3 7 11 15 19 23 27 31 35]),'LineStyle','none','LineWidth',1,'CapSize',10,'Color','k'); 
yt = get(gca, 'YTick');
xt = get(gca, 'XTick');
plot(xt([2 3]), [1 1]*0.32, '-k')
text(mean(xt([2 3])),0.35,txtb1,'FontSize',8,'FontWeight','bold')
plot(xt([2 4]), [1 1]*0.38, '-k')
text(mean(xt([2 4])),0.41,txtb2,'FontSize',8,'FontWeight','bold')
plot(xt([2 5]), [1 1]*0.44, '-k')
text(mean(xt([2 5])),0.47,txtb3,'FontSize',8,'FontWeight','bold')
plot(xt([2 6]), [1 1]*0.50, '-k')
text(mean(xt([2 6])),0.53,txtb4,'FontSize',8,'FontWeight','bold')
plot(xt([2 7]), [1 1]*0.56, '-k')
text(mean(xt([2 7])),0.59,txtb5,'FontSize',8,'FontWeight','bold')
plot(xt([2 8]), [1 1]*0.62, '-k')
text(mean(xt([2 8])),0.65,txtb6,'FontSize',8,'FontWeight','bold')
plot(xt([2 9]), [1 1]*0.68, '-k')
text(mean(xt([2 9])),0.71,txtb7,'FontSize',8,'FontWeight','bold')
plot(xt([2 10]), [1 1]*0.74, '-k')
text(mean(xt([2 10])),0.77,txtb8,'FontSize',8,'FontWeight','bold')

%save figures and data
savefig(h,'Figure6.fig')
print -depsc2 -painters Figure6.eps
