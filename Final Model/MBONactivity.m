%Author: Magdalena Springer, magdalena.springer@uni-koeln.de
%MBON activity Experiment
%MBON activation rates measured before and after extinction learning
%Experiments Results shown in Figure 5 in Springer et al (2020)

clear
C_Type ='class2';  %PN::KC connectivity
train_trials =12 ;  
OdorPlus=1;
OdorMinus=2;
OffSet=0.4;
number=10;
Input = [1 3]

%APPETITIVE LEARNING
InputRs=[1 0];  %determines odor valence code (-1=aversive, 0=neutral, 1=appetitive)


%%%M6 and MVP2 activity
Experiment='normal';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt,M6abs,M6ext] = ExtinctionLearning(C_Type,train_trials,OdorPlus,OffSet,Experiment,Input,InputRs);
    MVP2InputAbs1pl(patterns)=MVP2InputAbs(OdorPlus);
    M6InputAbs1pl(patterns)=M6InputAbs(OdorPlus);
    MVP2InputExt1pl(patterns)=MVP2InputExt(OdorPlus);
    M6InputExt1pl(patterns)=M6InputExt(OdorPlus);
    MVP2InputAbs1mi(patterns)=MVP2InputAbs(OdorMinus);
    M6InputAbs1mi(patterns)=M6InputAbs(OdorMinus);
    MVP2InputExt1mi(patterns)=MVP2InputExt(OdorMinus);
    M6InputExt1mi(patterns)=M6InputExt(OdorMinus);
end

fig=figure('units','centimeter','position', [28,226,15,15]); %Figure 1
%Experiment mit den Aktivit�ten der einzelnen MBONs
%Vergleicht die neuronale Aktivit�t in Denderiten von MBONS
subplot(2,2,1)
B(:,1) = MVP2InputAbs1pl;
B(:,2) = MVP2InputAbs1mi;
B(:,3) = MVP2InputExt1pl;
B(:,4) = MVP2InputExt1mi;
p1 = signrank(B(:,1),B(:,2));
p2 = signrank(B(:,3),B(:,4));
c= [0.18 0.314 0.596 ; 0.431 0.431 0.431]
boxplot(B(:,1:4),'Widths',0.7,'Colors',c);
set(findobj(gca,'type','line'),'linew',3);
set(findobj(gcf,'LineStyle','--'),'LineStyle','-')
h = findobj(gca,'Tag','Box');
for i = [2 4]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.541 0.655 0.827],'FaceAlpha',.5,'LineStyle','none');
end
for i = [1 3]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.847 0.847 0.847],'FaceAlpha',.5,'LineStyle','none');
end
set(gcf,'color','w');
%ylim([0 100])
title('A','Position',[-0.7 1.2],'FontSize',12);
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'CS+','CS-','CS+','CS-'},'FontSize',10);
set(gca,'YTick',[0 0.5 1],'YTickLabel',{'0','0.5','1'});
ylabel('Input into MVP2/V2','FontSize',12);
xlabel('Appetitive    Extinction','FontSize',10)
%Add significances
yt = get(gca, 'YTick');
axis([xlim    0  1.2])
xt = get(gca, 'XTick');
hold on
plot(xt([1 2]), [1 1]*max(max(B(:,1:2)))*1.1, '-k','LineWidth',3)
[txt1] = CalcSign(p1);
text(mean(xt([1 2])), max(max(B(:,1:2)))*1.2,txt1,'FontSize',12,'FontWeight','Normal')
plot(xt([3 4]), [1 1]*max(max(B(:,3:4)))*1.1, '-k','LineWidth',3) 
[txt2] = CalcSign(p2);
text(mean(xt([3 4])), max(max(B(:,3:4)))*1.2,txt2,'FontSize',12,'FontWeight','Normal')
hold off


subplot(2,2,3)
B(:,5) = M6InputAbs1pl;
B(:,6) = M6InputAbs1mi;
B(:,7) = M6InputExt1pl;
B(:,8) = M6InputExt1mi;
p3 = signrank(B(:,5),B(:,6));
p4 = signrank(B(:,7),B(:,8));
%subplot(2,1,2)
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
set(findobj(gca,'type','line'),'linew',3);
title('B','Position',[-0.7 1.2],'FontSize',12);

set(gcf,'color','w');
%ylim([0 100])
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'CS+','CS-','CS+','CS-'},'FontSize',10);
set(gca,'YTick',[0 0.5 1],'YTickLabel',{'0','0.5','1'});
ylabel('Input into MV2/M6','FontSize',12);
xlabel('Appetitive    Extinction','FontSize',10)
%Add significances
yt = get(gca, 'YTick');
axis([xlim    0  1.2])
xt = get(gca, 'XTick');
hold on
plot(xt([1 2]), [1 1]*max(max(B(:,5:6)))*1.1, '-k','LineWidth',3)
[txt3] = CalcSign(p3);
text(mean(xt([1 2])), max(max(B(:,5:6)))*1.2,txt3,'FontSize',12,'FontWeight','Normal')
plot(xt([3 4]), [1 1]*max(max(B(:,7:8)))*1.1, '-k','LineWidth',3) 
[txt4] = CalcSign(p4);
text(mean(xt([3 4])), max(max(B(:,7:8)))*1.2,txt4,'FontSize',12,'FontWeight','Normal')
hold off

%AVERSIVE LEARNING
InputRs=[-1 0];  %determines odor valence code (-1=aversive, 0=neutral, 1=appetitive)


%%%M6 und MVP2 Aktivit�t
Experiment='normal';
for patterns= 1:number
    [PIabs,PIext,MVP2InputI,M6InputI,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt,M6abs,M6ext] = ExtinctionLearning(C_Type,train_trials,OdorPlus,OffSet,Experiment,Input,InputRs); 
    MVP2InputAbs1pl(patterns)=MVP2InputAbs(OdorPlus);
    M6InputAbs1pl(patterns)=M6InputAbs(OdorPlus);
    MVP2InputExt1pl(patterns)=MVP2InputExt(OdorPlus);
    M6InputExt1pl(patterns)=M6InputExt(OdorPlus);
    MVP2InputAbs1mi(patterns)=MVP2InputAbs(OdorMinus);
    M6InputAbs1mi(patterns)=M6InputAbs(OdorMinus);
    MVP2InputExt1mi(patterns)=MVP2InputExt(OdorMinus);
    M6InputExt1mi(patterns)=M6InputExt(OdorMinus);
end


subplot(2,2,2)
C(:,1) = MVP2InputAbs1pl;
C(:,2) = MVP2InputAbs1mi;
C(:,3) = MVP2InputExt1pl;
C(:,4) = MVP2InputExt1mi;
p3 = signrank(C(:,1),C(:,2));
p4 = signrank(C(:,3),C(:,4));
c= [0.18 0.314 0.596 ; 0.431 0.431 0.431]
boxplot(C(:,1:4),'Widths',0.7,'Colors',c);
set(findobj(gca,'type','line'),'linew',3);
set(findobj(gcf,'LineStyle','--'),'LineStyle','-')
h = findobj(gca,'Tag','Box');
for i = [2 4]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.541 0.655 0.827],'FaceAlpha',.5,'LineStyle','none');
end
for i = [1 3]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.847 0.847 0.847],'FaceAlpha',.5,'LineStyle','none');
end
set(gcf,'color','w');
title('C','Position',[-0.7 1.2],'FontSize',12);
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'CS+','CS-','CS+','CS-'},'FontSize',10);
set(gca,'YTick',[0 0.5 1],'YTickLabel',{'0','0.5','1'});
set(gca,'YTick',[0 0.5 1],'YTickLabel',{'0','0.5','1'});
ylabel('Input into MVP2/V2','FontSize',12);
xlabel('Aversive    Extinction','FontSize',10)
%Add significances
yt = get(gca, 'YTick');
axis([xlim    0  1.2])
xt = get(gca, 'XTick');
hold on
plot(xt([1 2]), [1 1]*max(max(C(:,1:2)))*1.1, '-k','LineWidth',3)
[txt3] = CalcSign(p3);
text(mean(xt([1 2])), max(max(C(:,1:2)))*1.2,txt3,'FontSize',12,'FontWeight','Normal')
plot(xt([3 4]), [1 1]*max(max(C(:,3:4)))*1.1, '-k','LineWidth',3) 
[txt4] = CalcSign(p4);
text(mean(xt([3 4])), max(max(C(:,3:4)))*1.2,txt4,'FontSize',12,'FontWeight','Normal')
hold off


subplot(2,2,4)
C(:,5) = M6InputAbs1pl;
C(:,6) = M6InputAbs1mi;
C(:,7) = M6InputExt1pl;
C(:,8) = M6InputExt1mi;
p5 = signrank(C(:,5),C(:,6));
p6 = signrank(C(:,7),C(:,8));
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
set(findobj(gca,'type','line'),'linew',3);

set(gcf,'color','w');
%ylim([0 100])
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'CS+','CS-','CS+','CS-'},'FontSize',10);
set(gca,'YTick',[0 0.5 1],'YTickLabel',{'0','0.5','1'});
ylabel('Input into MV2/M6','FontSize',12);
title('D','Position',[-0.7 1.2],'FontSize',12);
xlabel('Aversive    Extinction','FontSize',10)
%Add significances
yt = get(gca, 'YTick');
axis([xlim    0  1.2])
xt = get(gca, 'XTick');
hold on
plot(xt([1 2]), [1 1]*max(max(C(:,5:6)))*1.1, '-k','LineWidth',3)
[txt5] = CalcSign(p5);
text(mean(xt([1 2])), max(max(C(:,5:6)))*1.2,txt5,'FontSize',12,'FontWeight','Normal')
plot(xt([3 4]), [1 1]*max(max(C(:,7:8)))*1.1, '-k','LineWidth',3) 
[txt6] = CalcSign(p6);
text(mean(xt([3 4])), max(max(C(:,7:8)))*1.2,txt6,'FontSize',12,'FontWeight','Normal')
hold off



%save data
save('MBONactivityApp','B')
save('MBONactivityAv','C')

