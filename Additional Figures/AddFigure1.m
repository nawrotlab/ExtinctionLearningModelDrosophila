%%%%%%SHIBIRE EXPERIMENT %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Additional Figure 1
%%%%block KCs during odor reactivation
clear
load('ShibireKCApp')
load('ShibireKCAv')

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

%
h=figure('units','centimeter','position',[20,9,8.6,8.6]);
subplot(2,1,2)%,'units','centimeter','position',[1.5,1,15,5.5]);
% b=plot(nanmean(A(:,[1 7 11 15 19 23 3])),'-o','Color',[0.5,0.5,0.5],...
%     'LineWidth',1,'MarkerEdgeColor','k',...
%     'MarkerSize',3,'MarkerFaceColor','k');
b=plot(nanmean(A(:,[1 7 11 15 19 23 3])),'o',...
    'MarkerEdgeColor','k',...
    'MarkerSize',3,'MarkerFaceColor','k');
hold on
plot(2:7,nanmean(A(:,[7 11 15 19 23 3])),'-','Color',[0.5,0.5,0.5],...
    'LineWidth',1);
o=-0.1
for i=1:3
    line([0:8],zeros(9)+o,'Color', [0.6 0.6 0.6],'LineStyle',':')
    o=o-0.1
    hold on
end

ylim([-0.4 0])
xlim([0.5 7.5])
set(gca,'YTick',[-0.6 -0.4 -0.2 0],'YTickLabel',{'-0.6','-0.4','-0.2','0'},'FontSize',8);
% yticks([0 -0.2 -0.4 -0.6])
% yticklabels({'0','y = 50','y = 100'})
set(gca,'XTick',[1:8],'XTickLabel',{'  no odor \newlinereactivation','100%','80%','70%','60%','50%','0%'},'FontSize',8);
title('Aversive Conditioning','FontSize',10);
%annotation('textbox',[0.01,0.46,0.06,0.05],'String','B','EdgeColor','None','FontSize',12,'FontWeight','bold');
ylabel('                                       Performance Index','FontSize',10);
yvalues = [1:7]
errorbar(yvalues,mean(A(:,[1 7 11 15 19 23 3])),SEM_A([1 7 11 15 19 23 3]),SEM_A([1 7 11 15 19 23 3]),'LineStyle','none','LineWidth',1,'CapSize',5,'Color','k');
yt = get(gca, 'YTick');
xt = get(gca, 'XTick');

hold off
yvalues = [1:7]
subplot(2,1,1);
b=plot(nanmean(B(:,[1 7 11 15 19 23 3])),'o',...
    'MarkerEdgeColor','k',...
    'MarkerSize',3,'MarkerFaceColor','k');
hold on
plot(2:7,nanmean(B(:,[7 11 15 19 23 3])),'-','Color',[0.5,0.5,0.5],...
    'LineWidth',1);
hold on 
o=0.1
for i=1:3
    line([0:8],zeros(9)+o,'Color', [0.6 0.6 0.6],'LineStyle',':')
    o=o+0.1
    hold on
end


set(gca,'XTick',[1:7],'XTickLabel',{[]});
set(gca,'YTick',[0, 0.2 0.4 0.6],'YTickLabel',{'0','0.2','0.4','0.6'},'FontSize',8);
ylim([0 0.4])
%ylabel('Performance Index','FontSize',12);
xlim([0.5 7.5])
%annotation('textbox',[0.01,0.93,0.06,0.05],'String','A','EdgeColor','None','FontSize',12,'FontWeight','bold');
set(gca,'XTick',[1:7],'XTickLabel',{'  no odor \newlinereactivation','100%','80%','70%','60%','50%','0%'},'FontSize',8);
errorbar(yvalues,mean(B(:,[1 7 11 15 19 23 3])),SEM_B([1 7 11 15 19 23 3]),SEM_B([1 7 11 15 19 23 3]),'LineStyle','none','LineWidth',1,'CapSize',5,'Color','k'); 
yt = get(gca, 'YTick');
xt = get(gca, 'XTick');
title('Appetitive Conditioning','FontSize',10);


%save figures and data
savefig(h,'ShibireKC.fig')
print -depsc2 -painters ShibireKC.eps
