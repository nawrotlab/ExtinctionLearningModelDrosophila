%Author: Magdalena Springer, magdalena.springer@uni-koeln.de
%Figure 5 in Springer et al (2020)
clear

load('MBONactivityApp')
load('MBONactivityAv')

mean_B = mean(B)%Data for App Conditioning
mean_B = mean_B'
mean_C = mean(C)%Data for Av Conditioning
mean_C = mean_C'
SEM_B = std(B,[],1);
SEM_C = std(C,[],1);

%Add significances
i=[1 3 5 7]
j=[2 4 6 8]

StatTestApp = [];
Papp = zeros(4,1);

for y=1:4
    Papp(y,1) = signrank(B(:,i(y)),B(:,j(y)));
end

StatTestAv = [];
Pav = zeros(4,1);
for y=1:4
    Pav(y,1) = signrank(C(:,i(y)),C(:,j(y)));
end

%Figure
fig=figure('units','centimeter','position', [28,226,8.6,9]);

%Appetitive Conditioning for MVP2 and V2
subplot(2,2,1)
c= [0.18 0.314 0.596 ; 0.431 0.431 0.431]
boxplot(B(:,1:4),'Widths',0.7,'Colors',c);
set(findobj(gca,'type','line'),'linew',1);
set(findobj(gcf,'LineStyle','--'),'LineStyle','-')
h = findobj(gca,'Tag','Box');
for i = [2 4]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.541 0.655 0.827],'FaceAlpha',.5,'LineStyle','none');
end
for i = [1 3]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.847 0.847 0.847],'FaceAlpha',.5,'LineStyle','none');
end

set(gcf,'color','w');
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'CS+','CS-','CS+','CS-'},'FontSize',8);
set(gca,'YTick',[0 0.5 1],'YTickLabel',{'0','0.5','1'});
ylabel('Input into MVP2/V2','FontSize',10);
xlabel('Appetitive    Extinction','FontSize',8)

%Add significances
yt = get(gca, 'YTick');
axis([xlim    0  1.2])
xt = get(gca, 'XTick');
title('A','Position',[-0.4 1.2],'FontSize',12);
hold on
plot(xt([1 2]), [1 1]*max(max(B(:,1:2)))*1.1, '-k')
[txt1] = CalcSign(Papp(1));
text(mean(xt([1 2])), max(max(B(:,1:2)))*1.2,txt1,'FontSize',8,'FontWeight','Normal','HorizontalAlignment','center')
plot(xt([3 4]), [1 1]*max(max(B(:,3:4)))*1.1, '-k') 
[txt2] = CalcSign(Papp(2));
text(mean(xt([3 4])), max(max(B(:,3:4)))*1.2,txt2,'FontSize',8,'FontWeight','Normal','HorizontalAlignment','center')
hold off

%Appetitive Conditioning for M2 and M6
subplot(2,2,3)
c = [0.792 0.239 0.553; 0.431 0.431 0.431]
boxplot(B(:,5:8),'Widths',0.7,'Colors',c);
set(findobj(gcf,'LineStyle','--'),'LineStyle','-')
h = findobj(gca,'Tag','Box');
for i = [2 4]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.89 0.475 0.733],'FaceAlpha',.5,'LineStyle','none');
end
for i = [1 3]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.847 0.847 0.847],'FaceAlpha',.5,'LineStyle','none');
end
set(findobj(gca,'type','line'),'linew',1);
set(gcf,'color','w');
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'CS+','CS-','CS+','CS-'},'FontSize',8);
set(gca,'YTick',[0 0.5 1],'YTickLabel',{'0','0.5','1'});
ylabel('Input into MV2/M6','FontSize',10);
xlabel('Appetitive    Extinction','FontSize',8)
%Add significances
yt = get(gca, 'YTick');
axis([xlim    0  1.2])
xt = get(gca, 'XTick');
hold on
title('B','Position',[-0.4 1.2],'FontSize',12);
plot(xt([1 2]), [1 1]*max(max(B(:,5:6)))*1.1, '-k')
[txt3] = CalcSign(Papp(3));
text(mean(xt([1 2])), max(max(B(:,5:6)))*1.2,txt3,'FontSize',8,'FontWeight','Normal','HorizontalAlignment','center')
plot(xt([3 4]), [1 1]*max(max(B(:,7:8)))*1.1, '-k') 
[txt4] = CalcSign(Papp(4));
text(mean(xt([3 4])), max(max(B(:,7:8)))*1.2,txt4,'FontSize',8,'FontWeight','Normal','HorizontalAlignment','center')
hold off

%Aversive Conditioning for MVP2 and V2
subplot(2,2,2)
c= [0.18 0.314 0.596 ; 0.431 0.431 0.431]
boxplot(C(:,1:4),'Widths',0.7,'Colors',c);
set(findobj(gca,'type','line'),'linew',1);
set(findobj(gcf,'LineStyle','--'),'LineStyle','-')
h = findobj(gca,'Tag','Box');
for i = [2 4]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.541 0.655 0.827],'FaceAlpha',.5,'LineStyle','none');
end
for i = [1 3]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.847 0.847 0.847],'FaceAlpha',.5,'LineStyle','none');
end
set(gcf,'color','w');
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'CS+','CS-','CS+','CS-'},'FontSize',8);
set(gca,'YTick',[0 0.5 1],'YTickLabel',{'0','0.5','1'});
set(gca,'YTick',[0 0.5 1],'YTickLabel',{'0','0.5','1'});
ylabel('Input into MVP2/V2','FontSize',10);
xlabel('Aversive    Extinction','FontSize',8)
%Add significances
yt = get(gca, 'YTick');
axis([xlim    0  1.2])
xt = get(gca, 'XTick');
title('C','Position',[-0.4 1.2],'FontSize',12);
hold on
plot(xt([1 2]), [1 1]*max(max(C(:,1:2)))*1.1, '-k')
[txt3] = CalcSign(Pav(1));
text(mean(xt([1 2])), max(max(C(:,1:2)))*1.2,txt3,'FontSize',8,'FontWeight','Normal','HorizontalAlignment','center')
plot(xt([3 4]), [1 1]*max(max(C(:,3:4)))*1.1, '-k') 
[txt4] = CalcSign(Pav(2));
text(mean(xt([3 4])), max(max(C(:,3:4)))*1.2,txt4,'FontSize',8,'FontWeight','Normal','HorizontalAlignment','center')
hold off

%Aversive Conditioning for MV2 and M6
subplot(2,2,4)
c = [0.792 0.239 0.553; 0.431 0.431 0.431]
boxplot(C(:,5:8),'Widths',0.7,'Colors',c);
set(findobj(gcf,'LineStyle','--'),'LineStyle','-')
h = findobj(gca,'Tag','Box');
for i = [2 4]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.89 0.475 0.733],'FaceAlpha',.5,'LineStyle','none');
end
for i = [1 3]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.847 0.847 0.847],'FaceAlpha',.5,'LineStyle','none');
end
set(findobj(gca,'type','line'),'linew',1);

set(gcf,'color','w');
%ylim([0 100])
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'CS+','CS-','CS+','CS-'},'FontSize',8);
set(gca,'YTick',[0 0.5 1],'YTickLabel',{'0','0.5','1'});
ylabel('Input into MV2/M6','FontSize',10);
title('D','Position',[-0.4 1.2],'FontSize',12);
xlabel('Aversive    Extinction','FontSize',8)
%Add significances
yt = get(gca, 'YTick');
axis([xlim    0  1.2])
xt = get(gca, 'XTick');
hold on
plot(xt([1 2]), [1 1]*max(max(C(:,5:6)))*1.1, '-k')
[txt5] = CalcSign(Pav(3));
text(mean(xt([1 2])), max(max(C(:,5:6)))*1.2,txt5,'FontSize',8,'FontWeight','Normal','HorizontalAlignment','center')
plot(xt([3 4]), [1 1]*max(max(C(:,7:8)))*1.1, '-k') 
[txt6] = CalcSign(Pav(4));
text(mean(xt([3 4])), max(max(C(:,7:8)))*1.2,txt6,'FontSize',8,'FontWeight','Normal','HorizontalAlignment','center')
hold off

NormDisApp = [] 
for i=1:8
NormDisApp = [NormDisApp adtest(B(:,i))];
end

NormDisAv = [] 
for i=1:8
NormDisAv = [NormDisAv adtest(C(:,i))];
end

%save figures and data
savefig(fig,'Figure5.fig')
set(gcf,'Units','centimeter');
screenposition = get(gcf,'Position');
set(gcf,...
    'PaperPosition',[0 0 screenposition(3:4)],...
    'PaperSize',[screenposition(3:4)]);
print -dpdf -painters Figure5