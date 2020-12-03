%Author: Magdalena Springer, magdalena.springer@uni-koeln.de
%Figure 2 in Springer et al (2020)

clear
fig = figure('units','centimeter','position',[20,9,16,12]);

load('LearningCurve_PIapp')
load('LearningCurve_PIav')

subplot(4,3,3,'units','centimeter','position',[11.5,9.5,4,2]);
SEM_A = std(PIabsolute1,[],1)/sqrt(size(PIabsolute1,1)); 
plot(mean(PIabsolute1(:,1:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.25 0.83 0.56],...
    'MarkerSize',3,'MarkerFaceColor',[0.25 0.83 0.56]);
hold on
plot(mean(PIabsolute1(:,1)),'o','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerSize',3,'MarkerFaceColor',[0.5 0.5 0.5]);
o=0.1
for i=1:3
    line([0:25],zeros(26)+o,'Color', [0.6 0.6 0.6],'LineStyle',':')
    o=o+0.1
    hold on
end
yvalues = [1:25];
set(gcf,'color','w');
set(gca,'box','off')
set(gca,'XTick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25],'XTickLabel',{'','', '', '', '', '', '', '', '', '', '', '', '','','','','','','','','','','','',''},'FontSize',10);
set(gca,'YTick',[0 0.2 0.4],'YTickLabel',{'0','0.2','0.4'},'FontSize',8);
xlim([0 26.5])
ylim([0 .4])
text(1.5,0.4,'Appetitive Conditioning','FontSize',10,'FontWeight','bold')

subplot(4,3,6,'units','centimeter','position',[11.5,7,4,2]);
SEM_B = std(PIabsolute2,[],1)/sqrt(size(PIabsolute2,1)); 
plot(mean(PIabsolute2(:,1:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[1 0.39 0.42],...
    'MarkerSize',3,'MarkerFaceColor',[1 0.39 0.42]);
hold on
plot(mean(PIabsolute2(:,1)),'o','MarkerEdgeColor',[0.5 0.5 0.5],'MarkerSize',3,'MarkerFaceColor',[0.5 0.5 0.5]);
o=-0.1
for i=1:3
    line([0:25],zeros(26)+o,'Color', [0.6 0.6 0.6],'LineStyle',':')
    o=o-0.1
    hold on
end
set(gcf,'color','w');
set(gca,'box','off')
set(gca,'XTick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25],'XTickLabel',{'','', '', '', '', '', '6', '', '', '', '', '', '12','','','','','','18','','','','','','24'},'FontSize',10);
set(gca,'YTick',[-0.4 -0.2 0],'YTickLabel',{'-0.4','-0.2','0'},'FontSize',8);
xlabel('Number of trials','FontSize',10);
ylabel('                          Preference Index','FontSize',10);
xlim([0 26.5])
ylim([-.4 0])
text(2,0,'Aversive Conditioning','FontSize',10,'FontWeight','bold')
hold off

%create Colormap for Heatmap
r = linspace(1,0,100);
g = linspace(1,0.447,100);
b = linspace(1,0.741,100);
cmap = zeros(100,3);
cmap(1:100,1)=r;
cmap(1:100,2)=g;
cmap(1:100,3)=b;

load('GeneralizationInputPatterns')
load('GeneralizationR_KCpl')
subplot(4,3,[7,10],'units','centimeter','position',[1,1.5,3,5]);
%subplot(1,2,1)
h = imagesc(InputPatterns)%,clims([0 1])),'ColorbarVisible','off','Colormap',cmap);
yticklabels({})
xticks([1:6])
xticklabels({'CS+','80%','60%','40%','20%','0%'})
ax = gca;
ax.FontSize = 8;
xtickangle(45)
annotation('textbox',[0.003,0.95,0.06,0.05],'String','A','EdgeColor','None','FontSize',12,'FontWeight','bold');
ylabel('Projection neurons','FontSize',10)
xlabel('                                        PN pattern overlap','FontSize',10)

subplot(4,3,[8 11],'units','centimeter','position',[5,1.5,3,5]);
i=imagesc(R_KCpl)
colormap(cmap)
yticklabels({})
xticks([1:6])
xticklabels({'CS+','80%','60%','40%','20%','0%'})
ax = gca;
ax.FontSize = 8;
xtickangle(45)
set(gca,'ActivePositionProperty','position')
colorbar('Ticks',[0:.1:1],'Ticklabels',{'0','','','','','','','','','','1'})
set(gca,'ActivePositionProperty','position')
text(8,50,'activation level','Rotation',90,'HorizontalAlignment','center','FontSize',10)
%c.Label.String='activation level'
annotation('textbox',[0.63,0.95,0.06,0.05],'String','B','EdgeColor','None','FontSize',12,'FontWeight','bold');
ylabel('Kenyon cells','FontSize',10)


load('GeneralizationApp')
load('GeneralizationAv')
%h = figure('units','centimeter','position',[18,12,16,21]);%Figure 1 ,
subplot(4,3,9,'units','centimeter','Position',[11.5,3.5,4,2]);
SEM_A = std(A,[],1)/sqrt(size(A,1)); 
boxplot(A(:,1:6),'Colors',[0.25 0.83 0.56;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0],'Widths',0.5)
hold on 
set(gca,'box','off')
set(findobj(gca,'type','line'),'linew',1)
line(0:7,[0,0,0,0,0,0,0,0],'LineStyle',':','Color','black')
text(1,0.45,'Appetitive Conditioning','FontSize',10,'FontWeight','bold')
set(gcf,'color','w');
ylabel('    ','FontSize',10);
set(gca,'XTick',[1 2 3 4 5 6],'XTickLabel',{'', '','','','',''},'FontSize',8);
ylim([-0.1 0.4])
annotation('textbox',[0.003,0.5,0.06,0.05],'String','C','EdgeColor','None','FontSize',12,'FontWeight','bold');
set(gca,'ActivePositionProperty','position')
hold off

subplot(4,3,12,'units','centimeter','Position',[11.5,1,4,2]);
SEM_A = std(E,[],1)/sqrt(size(E,1)); 
boxplot(E,'Colors',[1 0.39 0.42;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0],'Widths',0.5);
hold on
set(gca,'box','off')
set(gca,'ActivePositionProperty','position')
set(findobj(gca,'type','line'),'linew',1)
line(0:7,[0,0,0,0,0,0,0,0],'LineStyle',':','Color','black')
text(1,0.15,'Aversive Conditioning','FontSize',10,'FontWeight','bold')
set(gcf,'color','w');
set(gca,'XTick',[1 2 3 4 5 6],'XTickLabel',{'CS+ ', '80%','60%','40%','20%','0%'},'FontSize',8);
ylabel('                          Preference Index','FontSize',10);
ylim([-0.4 0.1])
annotation('textbox',[0.63,0.46,0.06,0.05],'String','D','EdgeColor','None','FontSize',12,'FontWeight','bold');
set(gca,'ActivePositionProperty','position')
xlabel('PN pattern overlap','Fontsize',10)
hold off

subplot(4,3,[1,2,4,5],'units','centimeter','Position',[0,6.8,10,5]);
imshow('Protocol-short.tiff');

%Save Figure
savefig(fig,'Figure2.fig')
print -depsc2 -painters Figure2.eps