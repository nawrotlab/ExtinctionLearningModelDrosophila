%Author: Magdalena Springer, magdalena.springer@uni-koeln.de
%Figure 3 in Springer et al (2020)

clear
load('BehavioralExpPrefIApp')
load('BehavioralExpPrefIAv')
load('BehavioralExpPerfIApp')
load('BehavioralExpPerfIAv')

fig=figure('units','centimeter','position',[6,6,17,11]);

subplot(2,4,1:4,'units','centimeter','Position',[0.1,6,17,5]);
imshow('Protocol-full.tiff');
annotation('textbox',[0,0.95,0.06,0.05],'String','A','EdgeColor','None','FontSize',12,'FontWeight','bold');

subplot(2,4,5,'units','centimeter','Position',[1.25,1,2.5,4])
SEM_A = std(A,[],1)/sqrt(size(A,1)); 
boxplot(A(:,1:4),'Colors','k','Widths',0.6);
hold on
line(0:5,[0,0,0,0,0,0],'LineStyle',':','Color','black')
h = findobj(gca,'Tag','Box');
for i = [1 2]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.349 0.341 0.337],'FaceAlpha',.9,'LineStyle','none');
end
for i = [3 4]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.678 0.678 0.686],'FaceAlpha',.9,'LineStyle','none');
end
set(gcf,'color','w');
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'CS+', 'CS-','CS+', 'CS-'},'FontSize',8);
ylim([-0.1 0.5])
title('B','Position',[-0.7 0.52],'FontSize',12);
xlabel('Appetitive    Extinction','FontSize',8)
ylabel('Preference Index','FontSize',10);
C(:,1) = (A(:,1))-(A(:,2));
C(:,2) = (A(:,3))-(A(:,4));


subplot(2,4,7,'units','centimeter','Position',[9.75,1,2.8,4])
yvalues = [1 2];
b=bar(mean(C(:,[1 2])),'FaceColor','flat');
b.CData(1,:) = [0.678 0.678 0.686];
b.CData(2,:) = [0.349 0.341 0.337];
set(gcf,'color','w');
hold on
SEM_C = std(C,[],1);%/sqrt(size(C,1));
errorbar(yvalues,mean(C(:,[1 2])),SEM_C([1 2]),SEM_C([1 2]),'LineStyle','none','LineWidth',1,'CapSize',10,'Color','k'); 
plot(yvalues(1),C(:,1),'ko','MarkerSize',1.5);
plot(yvalues(2),C(:,2),'ko','MarkerSize',1.5);
ylim([-0.1 0.5])
xlim([0.5 2.5])
set(gca,'XTick',[1 2],'XTickLabel',{'Appetitive','Extinction'},'FontSize',8);
ylabel('Performance Index','FontSize',10);
title('D','Position',[0.15 0.52],'FontSize',12);
hold off

%Add significances
p1 = ranksum(C(:,1),C(:,2));

yt = get(gca, 'YTick');
xt = get(gca, 'XTick');
hold on
[txt1] = CalcSign(p1);
plot(xt([1 2]), [1 1]*0.35, '-k')
text(mean(xt([1 2])), 0.4,txt1,'FontSize',8,'HorizontalAlignment','center')
hold off




subplot(2,4,6,'units','centimeter','Position',[5.35,1,2.5,4])
SEM_B = std(B,[],1)/sqrt(size(B,1)); 
boxplot(B(:,1:4),'Colors','k','Widths',0.6);
set(gca,'ActivePositionProperty','position')
hold on
line(0:5,[0,0,0,0,0,0],'LineStyle',':','Color','black')
h = findobj(gca,'Tag','Box');
for i = [1 2]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.349 0.341 0.337],'FaceAlpha',.9,'LineStyle','none');
end
for i = [3 4]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.678 0.678 0.686],'FaceAlpha',.9,'LineStyle','none');
end
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'CS+', 'CS-','CS+', 'CS-'},'FontSize',8);
xlabel('Aversive    Extinction','FontSize',8)
ylabel('Preference Index','FontSize',10);
set(gcf,'color','w');
ylim([-0.5 0.1])
title('C','Position',[-0.7 0.12],'FontSize',12);

D(:,1) = (B(:,1))-(B(:,2));
D(:,2) = (B(:,3))-(B(:,4));


subplot(2,4,8,'units','centimeter','Position',[13.85,1,2.8,4])
yvalues = [1 2];
b=bar(mean(D(:,[1 2])),'FaceColor','flat');
b.CData(1,:) = [0.678 0.678 0.686];
b.CData(2,:) = [0.349 0.341 0.337];
set(gcf,'color','w');
hold on
SEM_D = std(D,[],1);
errorbar(yvalues,mean(D(:,[1 2])),SEM_D([1 2]),SEM_D([1 2]),'LineStyle','none','LineWidth',1,'CapSize',10,'Color','k'); 
plot(yvalues(1),D(:,1),'ko','MarkerSize',1.5);
plot(yvalues(2),D(:,2),'ko','MarkerSize',1.5);
ylim([-0.5 0.1])
xlim([0.5 2.5])
set(gca,'XTick',[1 2],'XTickLabel',{'Aversive','Extinction'},'FontSize',8);
ylabel('Performance Index','FontSize',10);
title('E','Position',[0.14 0.12],'FontSize',12);
hold off

%Add significanes
p2 = ranksum(D(:,1),D(:,2));

yt = get(gca, 'YTick');
xt = get(gca, 'XTick');
hold on
[txt2] = CalcSign(p2);
plot(xt([1 2]), [1 1]*-0.4, '-k')
text(mean(xt([1 2])),-0.35,txt2,'FontSize',8,'HorizontalAlignment','center')

hold off

%Save Figure
savefig(fig,'Figure3.fig')
set(gcf,'Units','centimeter');
screenposition = get(gcf,'Position');
set(gcf,...
    'PaperPosition',[0 0 screenposition(3:4)],...
    'PaperSize',[screenposition(3:4)]);
print -dpdf -painters Figure3