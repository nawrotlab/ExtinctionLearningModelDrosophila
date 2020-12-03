%Author: Magdalena Springer, magdalena.springer@uni-koeln.de
%Figure 4 in Springer et al (2020)

clear
%APPETITIVE LEARNING
%Plotting the neuron activation rates for appetitive learning

load LearningCurveApp.mat
clear h
f=figure('units','centimeter','position',[6,6,17,13.5]);

%Plot reinforcing signal
subplot(5,2,1)
line(0:30,zeros(31),'Color', [0.6 0.6 0.6],'LineStyle',':');
hold on
plot(Ract(1:13),'-','Color','k');
plot(17:28,Ract(14:end),'-','Color','k');
set(gca,'FontSize',8)
title('Appetitive','FontSize',12)
yl = sprintf('US');
ylabel(yl,'FontSize',10);
ylim([-1 1])
xlim([0 30])
set(gca,'XTick',[],'XColor','w')
set(gca,'box','off')

%Plot DAN activation rates
subplot(5,2,3)
plot((PAMact(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.25 0.83 0.56],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.25 0.83 0.56]);
hold on
plot((PPL1act(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[1 0.39 0.42],...
    'MarkerSize',3)%,'MarkerFaceColor',[1 0.39 0.42]);
plot(17:28,(PAMact(:,14:end)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.25 0.83 0.56],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.25 0.83 0.56]);
plot(17:28,(PPL1act(:,14:end)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[1 0.39 0.42],...
    'MarkerSize',3)%,'MarkerFaceColor',[1 0.39 0.42]);
line(0:30,zeros(31,1)+10^-2,'Color', [0.6 0.6 0.6],'LineStyle',':');
line(0:30,zeros(31,1)+1,'Color', [0.6 0.6 0.6],'LineStyle',':');
xlim([0 30])
set(gca,'FontSize',8)
set(gca,'XTick',[1 2 7 13 17 23 28],'XTickLabel',{'0','1','6','12','1','6','12'},'YScale','Log');
set(gca,'YTick',[10^-4 10^-2 1])
yl = sprintf('DAN activation/ \nPrediction error');
ylabel(yl,'FontSize',10);
set(gca,'box','off')
set(gca,'ActivePositionProperty','position')
xlabel('training trials','FontSize',10)

%Plot KC::MBON input
subplot(5,2,5)
pos = get(gca, 'Position');
offset2 = -0.04;
pos(2) = pos(2) + offset2;
set(gca, 'Position', pos)
plot((MBONposact(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.541 0.655 0.827],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.541 0.655 0.827]);
hold on
plot((MBONnegact(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.89 0.475 0.733],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.89 0.475 0.733]);
plot(17:28,(MBONposact(:,14:end)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.541 0.655 0.827],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.541 0.655 0.827]);
plot(17:28,(MBONnegact(:,14:end)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.89 0.475 0.733],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.89 0.475 0.733]);
line(0:30,zeros(31)+0.5,'Color', [0.6 0.6 0.6],'LineStyle',':');
line(0:30,zeros(31)+1,'Color', [0.6 0.6 0.6],'LineStyle',':');
ylim([0 1])
xlim([0 30])
set(gca,'FontSize',8)
set(gca,'XTick',[1 7 13 19],'XTickLabel',' ')
yl = sprintf('KC::MBON \ninput');
ylabel(yl,'FontSize',10);
set(gca,'box','off')
set(gca,'ActivePositionProperty','position')

%Plot MBON output
subplot(5,2,7)
pos = get(gca, 'Position');
offset2 = -0.04;
pos(2) = pos(2) + offset2;
set(gca, 'Position', pos)
plot((MBONposact(:,1:13)),'-^','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.541 0.655 0.827],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.541 0.655 0.827]);
hold on
plot((MBONnegact(:,1:13)),'-^','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.89 0.475 0.733],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.89 0.475 0.733]);
plot((V2act(:,1:13)),'-x','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.18 0.314 0.596],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.541 0.655 0.827]);
plot((M6act(:,1:13)),'-x','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.792 0.239 0.553],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.89 0.475 0.733]);
plot(17:28,(MBONposact(:,14:25)),'-^','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.541 0.655 0.827],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.541 0.655 0.827]);
plot(17:28,(MBONnegact(:,14:25)),'-^','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.89 0.475 0.733],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.89 0.475 0.733]);
plot(17:28,(V2act(:,14:25)),'-x','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.18 0.314 0.596],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.541 0.655 0.827]);
plot(17:28,(M6act(:,14:25)),'-x','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.792 0.239 0.553],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.89 0.475 0.733]);
line(0:30,zeros(31)+0.5,'Color', [0.6 0.6 0.6],'LineStyle',':');
line(0:30,zeros(31)+1,'Color', [0.6 0.6 0.6],'LineStyle',':');
ylim([0 1])
xlim([0 30])
set(gca,'XTick',[1 7 13 19],'XTickLabel',' ')
set(gca,'FontSize',8)
%ylabel('KC::MBON \newline input')
yl = sprintf('MBON \noutput');
ylabel(yl,'FontSize',10);
set(gca,'box','off')
set(gca,'ActivePositionProperty','position')


%Plot Preference Index 
subplot(5,2,9);
pos = get(gca, 'Position');
offset2 = -0.04;
pos(2) = pos(2) + offset2;
set(gca, 'Position', pos)
SEM_A = std(PIact,[],1)/sqrt(size(PIact,1)); 
plot((PIact(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.5 0.5 0.5],...
    'MarkerSize',3,'MarkerFaceColor',[0.5 0.5 0.5]);
hold on
plot(17:28,(PIact(:,14:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.5 0.5 0.5],...
    'MarkerSize',3,'MarkerFaceColor',[0.5 0.5 0.5]);
o=0.1;
for i=1:5
    line([0:30],zeros(31)+o,'Color', [0.6 0.6 0.6],'LineStyle',':')
    o=o+0.1;
    hold on
end
yvalues = [1:25];
set(gcf,'color','w');
set(gca,'box','off')
set(gca,'XTick',[1 2 7 13 17 23 28],'XTickLabel',{'0','1','6','12','1','6','12'});
set(gca,'YTick',[0.1 0.3],'FontSize',8);
yl = sprintf('Preference \nIndex');
ylabel(yl,'FontSize',10);
xlabel('test trials','FontSize',10)
xlim([0 30])
ylim([0 0.35])
set(gca,'ActivePositionProperty','position')

%AVERSIVE LEARNING
%Plotting the neuron activation rates for aversive learning
load LearningCurveAv.mat

%Plot Reinforcing signal
clear h
subplot(5,2,2)
line(0:30,zeros(31),'Color', [0.6 0.6 0.6],'LineStyle',':');
hold on
pos = get(gca, 'Position');
xoffset = -0.05;
pos(1) = pos(1) + xoffset;
set(gca, 'Position', pos)
plot(Ract(1:13),'-','Color','k');
plot(17:28,Ract(14:end),'-','Color','k');
set(gca,'FontSize',8)
title('Aversive','FontSize',12)
ylim([-1 1])
xlim([0 30])
set(gca,'XTick',[],'XColor','w')
set(gca,'box','off')

%Plot DAN activation rates
subplot(5,2,4)
pos = get(gca, 'Position');
xoffset = -0.05;
pos(1) = pos(1) + xoffset;
set(gca, 'Position', pos)
plot((PAMact(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.25 0.83 0.56],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.25 0.83 0.56]);
hold on
plot((PPL1act(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[1 0.39 0.42],...
    'MarkerSize',3)%,'MarkerFaceColor',[1 0.39 0.42]);
plot(17:28,(PAMact(:,14:end)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.25 0.83 0.56],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.25 0.83 0.56]);
plot(17:28,(PPL1act(:,14:end)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[1 0.39 0.42],...
    'MarkerSize',3)%,'MarkerFaceColor',[1 0.39 0.42]);
line(0:30,zeros(31,1)+10^-2,'Color', [0.6 0.6 0.6],'LineStyle',':');
line(0:30,zeros(31,1)+1,'Color', [0.6 0.6 0.6],'LineStyle',':');
set(gca,'FontSize',8)
legend('PAM','PPL1','Location','northwest','FontSize',8)
leg = findobj(gcf, 'Type', 'Legend');
pos = get(leg, 'Position');
xoffset = 0.31;
pos(1) = pos(1) + xoffset;
set(leg(1,1), 'Position', pos)
legend('boxoff')
xlim([0 30])
set(gca,'XTick',[1 2 7 13 17 23 28],'XTickLabel',{'0','1','6','12','1','6','12'},'YScale','Log');
set(gca,'box','off')
xlabel('training trials','FontSize',10)

%Plot KC::MBON input
subplot(5,2,6)
pos = get(gca, 'Position');
xoffset = -0.05;
pos(1) = pos(1) + xoffset;
offset2 = -0.04;
pos(2) = pos(2) + offset2;
set(gca, 'Position', pos)
plot((MBONposact(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.541 0.655 0.827],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.541 0.655 0.827]);
hold on
plot((MBONnegact(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.89 0.475 0.733],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.89 0.475 0.733]);
plot(17:28,(MBONposact(:,14:end)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.541 0.655 0.827],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.541 0.655 0.827]);
plot(17:28,(MBONnegact(:,14:end)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.89 0.475 0.733],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.89 0.475 0.733]);
line(0:30,zeros(31)+0.5,'Color', [0.6 0.6 0.6],'LineStyle',':');
line(0:30,zeros(31)+1,'Color', [0.6 0.6 0.6],'LineStyle',':');
set(gca,'FontSize',8)
legend('MVP2/V2','MV2/M6','Location','northwest','FontSize',8)
leg = findobj(gcf,'Type', 'Legend');
pos = get(leg(1),'Position');
xoffset = 0.31;
pos(1) = pos(1) + xoffset;
set(leg(1), 'Position', pos)
legend('boxoff')
ylim([0 1])
xlim([0 30])
set(gca,'XTick',[1 7 13 19],'XTickLabel',' ')
set(gca,'box','off')

%Plot MBON output
subplot(5,2,8)
pos = get(gca, 'Position');
xoffset = -0.05;
pos(1) = pos(1) + xoffset;
offset2 = -0.04;
pos(2) = pos(2) + offset2;
set(gca, 'Position', pos)
plot((MBONposact(:,1:13)),'-^','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.541 0.655 0.827],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.541 0.655 0.827]);
hold on
plot((MBONnegact(:,1:13)),'-^','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.89 0.475 0.733],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.89 0.475 0.733]);
plot((V2act(:,1:13)),'-x','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.18 0.314 0.596],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.541 0.655 0.827]);
plot((M6act(:,1:13)),'-x','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.792 0.239 0.553],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.89 0.475 0.733]);
plot(17:28,(MBONposact(:,14:25)),'-^','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.541 0.655 0.827],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.541 0.655 0.827]);
plot(17:28,(MBONnegact(:,14:25)),'-^','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.89 0.475 0.733],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.89 0.475 0.733]);
plot(17:28,(V2act(:,14:25)),'-x','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.18 0.314 0.596],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.541 0.655 0.827]);
plot(17:28,(M6act(:,14:25)),'-x','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.792 0.239 0.553],...
    'MarkerSize',3)%,'MarkerFaceColor',[0.89 0.475 0.733]);
line(0:30,zeros(31)+0.5,'Color', [0.6 0.6 0.6],'LineStyle',':');
line(0:30,zeros(31)+1,'Color', [0.6 0.6 0.6],'LineStyle',':');
ylim([0 1])
xlim([0 30])
legend('MVP2','MV2','V2','M6','NumColumns',1,'Location','northwest','FontSize',8)
leg = findobj(gcf, 'Type', 'Legend');
clear pos
pos = get(leg(1), 'Position');
xoffset = 0.31;
pos(1) = pos(1) + xoffset;
set(leg(1), 'Position', pos);
legend('boxoff');
set(gca,'XTick',[1 7 13 19],'XTickLabel',' ')
set(gca,'FontSize',8)
set(gca,'box','off')

%Plot Preference Index
subplot(5,2,10);
pos = get(gca, 'Position');
xoffset = -0.05;
pos(1) = pos(1) + xoffset;
offset2 = -0.04;
pos(2) = pos(2) + offset2;
set(gca, 'Position', pos)
SEM_A = std(PIact,[],1)/sqrt(size(PIact,1)); 
plot((PIact(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.5 0.5 0.5],...
    'MarkerSize',3,'MarkerFaceColor',[0.5 0.5 0.5]);
hold on
plot(17:28,(PIact(:,14:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',1,'MarkerEdgeColor',[0.5 0.5 0.5],...
    'MarkerSize',3,'MarkerFaceColor',[0.5 0.5 0.5]);
o=0.3;
for i=1:4
    line([0:30],zeros(31)-o,'Color', [0.6 0.6 0.6],'LineStyle',':')
    o=o-0.1;
    hold on
end
yvalues = [1:25];
set(gcf,'color','w');
set(gca,'box','off')
set(gca,'XTick',[1 2 7 13 17 23 28],'XTickLabel',{'0','1','6','12','1','6','12'});
set(gca,'YTick',[-0.3 -0.1],'FontSize',8);
xlabel('test trials','FontSize',10)
xlim([0 30])
ylim([-0.35 0])

annotation('textbox',[0.01,0.93,0.06,0.05],'String','A','EdgeColor','None','FontSize',12,'FontWeight','bold');
annotation('textbox',[0.01,0.53,0.06,0.05],'String','B','EdgeColor','None','FontSize',12,'FontWeight','bold');
annotation('textbox',[0.46,0.93,0.06,0.05],'String','C','EdgeColor','None','FontSize',12,'FontWeight','bold');
annotation('textbox',[0.46,0.53,0.06,0.05],'String','D','EdgeColor','None','FontSize',12,'FontWeight','bold');


%%%Save Files
savefig('Figure4.fig')
print -depsc2 -painters Figure4.eps