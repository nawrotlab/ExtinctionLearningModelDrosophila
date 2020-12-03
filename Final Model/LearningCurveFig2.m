%Author: Magdalena Springer, magdalena.springer@uni-koeln.de
%Learning Curve Experiment
%Appetitive and Aversive Learning over 24 trials
%Experiments Results shown in Figure 2 B in Springer et al (2020)

clear
C_Type ='class2';   %connectivity PN::KC
train_trials = 24 ; 
Odor=1;
CSmin = 2;
OffSet=0;
number=4;
Input = [1 3];
%---------------------------

%APPETITIVE LEARNING
InputRs=[1 0]; %determines odor valence code (-1=aversive, 0=neutral, 1=appetitive)

Experiment='normal';

for patterns= 1:number
    for train_trials = 1:25
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt,trash,trash,PAM,PPL1,WeightM6,WeightMVP2] = ExtinctionLearning(C_Type,train_trials-1,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns,train_trials)=PIabs(Odor);
    PIextinction1(patterns,train_trials)=PIext(Odor);
    PAMact(patterns,train_trials)=PAM(Odor);
    PPL1act(patterns,train_trials) =PPL1(Odor);
    MBONpos1(patterns,train_trials)=MVP2InputAbs(Odor);
    MBONneg1(patterns,train_trials)=M6InputAbs(Odor);
    MBONpos1(patterns,train_trials)=MVP2InputAbs(Odor);
    MBONneg1(patterns,train_trials)=M6InputAbs(Odor);
    W_M61(patterns,train_trials)= WeightM6;
    W_MVP21(patterns,train_trials)= WeightMVP2;
    end
end

h=figure%('units','centimeter','position',[1,1,15,18.5]);
subplot(2,4,4)%,'units','centimeter','position',[11,14.5,3.5,3.2]);
SEM_A = std(PIabsolute1,[],1)/sqrt(size(PIabsolute1,1)); 
plot(mean(PIabsolute1(:,1:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.25 0.83 0.56],...
    'MarkerSize',4,'MarkerFaceColor',[0.25 0.83 0.56]);
hold on
o=0.1
for i=1:5
    line([0:25],zeros(26)+o,'Color', [0.6 0.6 0.6],'LineStyle',':')
    o=o+0.1
    hold on
end
yvalues = [1:25];
set(gcf,'color','w');
set(gca,'box','off')
set(gca,'XTick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25],'XTickLabel',{'0','', '', '', '', '5', '', '', '', '', '10', '', '','','','15','','','','','20','','','',''},'FontSize',10);
set(gca,'YTick',[0 0.2 0.4],'YTickLabel',{'0','0.2','0.4'},'FontSize',10);
% xlabel('Number of trials','FontSize',12);
ylabel('Preference Index','FontSize',12);
%ylim([0 0.7])
xlim([0 25.5])
ylim([0 1])
title('Appetitive Learning','FontSize',12);



subplot(2,4,1)
plot(mean(PAMact(:,1:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.25 0.83 0.56],...
    'MarkerSize',4,'MarkerFaceColor',[0.25 0.83 0.56]);
hold on
plot(mean(PPL1act(:,1:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[1 0.39 0.42],...
    'MarkerSize',4,'MarkerFaceColor',[1 0.39 0.42]);
ylim([0 1])
ylabel('activation level')
legend('PAM','PPL1')
title('DAN activity')

subplot(2,4,3)
plot(mean(MBONpos1(:,1:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.18 0.314 0.596],...
    'MarkerSize',4,'MarkerFaceColor',[0.18 0.314 0.596]);
hold on
plot(mean(MBONneg1(:,1:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.792 0.239 0.553],...
    'MarkerSize',4,'MarkerFaceColor',[0.792 0.239 0.553]);
ylim([0 1])
ylabel('activation level')
legend('MBON pos','MBON neg')
title('MBON activity')

subplot(2,4,2)
plot(mean(W_M61(:,1:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.792 0.239 0.553],...
    'MarkerSize',4,'MarkerFaceColor',[0.792 0.239 0.553]);
hold on
plot(mean(W_MVP21(:,1:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.18 0.314 0.596],...
    'MarkerSize',4,'MarkerFaceColor',[0.18 0.314 0.596]);

%AVERSIVE LEARNING

InputRs=[-1 0];%bestimme, ob aversiv (1) oder appetitiv(2) gelernt werden soll

for patterns= 1:number
    for train_trials = 1:25
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt,trash,trash,PAM,PPL1,WeightM6,WeightMVP2] = ExtinctionLearning(C_Type,train_trials-1,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute2(patterns,train_trials)=PIabs(Odor);
    PIextinction2(patterns,train_trials)=PIext(Odor);
    PAMact2(patterns,train_trials)=PAM(Odor);
    PPL1act2(patterns,train_trials) =PPL1(Odor);
    MBONpos2(patterns,train_trials)=MVP2InputAbs(Odor);
    MBONneg2(patterns,train_trials)=M6InputAbs(Odor);
    W_M62(patterns,train_trials)= WeightM6;
    W_MVP22(patterns,train_trials)= WeightMVP2;
    end
end

%Boxplots f�r CS+ und CS-
subplot(2,4,8)%,'units','centimeter','position',[11,9.5,3.5,3.2]);
SEM_B = std(PIabsolute2,[],1)/sqrt(size(PIabsolute2,1)); 
plot(mean(PIabsolute2(:,1:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[1 0.39 0.42],...
    'MarkerSize',4,'MarkerFaceColor',[1 0.39 0.42]);
hold on
o=0
for i=1:5
    line([0:25],zeros(26)+o,'Color', [0.6 0.6 0.6],'LineStyle',':')
    o=o-0.1
    hold on
end
set(gcf,'color','w');
set(gca,'box','off')
set(gca,'XTick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25],'XTickLabel',{'0','', '', '', '', '5', '', '', '', '', '10', '', '','','','15','','','','','20','','','',''},'FontSize',10);
set(gca,'YTick',[-0.4 -0.2 0],'YTickLabel',{'-0.4','-0.2','0'},'FontSize',10);
xlabel('Number of trials','FontSize',12);
ylabel('Preference Index','FontSize',12);
%ylim([-0.7 0])
xlim([0 25.5])
ylim([-1 0])
title('Aversive Learning','FontSize',12);
hold off


subplot(2,4,5)
plot(mean(PAMact2(:,1:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.25 0.83 0.56],...
    'MarkerSize',4,'MarkerFaceColor',[0.25 0.83 0.56]);
hold on
plot(mean(PPL1act2(:,1:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[1 0.39 0.42],...
    'MarkerSize',4,'MarkerFaceColor',[1 0.39 0.42]);
ylim([0 1])
ylabel('activation level')
legend('PAM','PPL1')
title('DAN activity')

subplot(2,4,7)
plot(mean(MBONpos2(:,1:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.18 0.314 0.596],...
    'MarkerSize',4,'MarkerFaceColor',[0.18 0.314 0.596]);
hold on
plot(mean(MBONneg2(:,1:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.792 0.239 0.553],...
    'MarkerSize',4,'MarkerFaceColor',[0.792 0.239 0.553]);
ylim([0 1])
ylabel('activation level')
legend('MBON pos','MBON neg')
title('MBON activity')


subplot(2,4,6)
plot(mean(W_M62(:,1:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.792 0.239 0.553],...
    'MarkerSize',4,'MarkerFaceColor',[0.792 0.239 0.553]);
hold on
plot(mean(W_MVP22(:,1:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.18 0.314 0.596],...
    'MarkerSize',4,'MarkerFaceColor',[0.18 0.314 0.596]);

%Save Data
save('LearningCurve_PIapp','PIabsolute1')
save('LearningCurve_PIav','PIabsolute2')