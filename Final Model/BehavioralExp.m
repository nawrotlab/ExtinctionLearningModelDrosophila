%Author: Magdalena Springer, magdalena.springer@uni-koeln.de
%Behavioral Experiment
%This experiments consists out of associative and extinction learning
%Experiments Results shown in Figure 3 in Springer et al (2020)

clear
C_Type ='class2';     % class1 or class2 of Kenyon cells (higher connectivity)
train_trials =12 ;        % how  many training trials
Odor=1;
CSmin = 2;
OffSet=0;
number=10; %number of animals
InputRs=[1 0];%determine odor code calence
Input = [1 3]


%%%%Appetitive and extinction learning
Experiment='normal';

for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    MVP2InputAbs1(patterns)=MVP2InputAbs(Odor);
    M6InputAbs1(patterns)=M6InputAbs(Odor);
end

for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
    MVP2InputExt1(patterns)=MVP2InputExt(Odor);
    M6InputExt1(patterns)=M6InputExt(Odor);
end


fig=figure('units','centimeter','position',[6,6,15,15]);%Figure 1 ,
%Boxplots for CS+ and CS-
subplot(2,2,1)
A(:,1) = PIabsolute1;
A(:,2) = PIabsolute2;
A(:,3) = PIextinction1;
A(:,4) = PIextinction2;
SEM_A = std(A,[],1)/sqrt(size(A,1)); 
boxplot(A(:,1:4),'Colors','k','Widths',0.9);
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
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'CS+', 'CS-','CS+', 'CS-'},'FontSize',10);
ylim([-0.1 0.5])
title('A','Position',[-0.7 0.52],'FontSize',12);
xlabel('Appetitive    Extinction','FontSize',10)
ylabel('Preference Index','FontSize',12);

C(:,1) = (A(:,1))-(A(:,2));
C(:,2) = (A(:,3))-(A(:,4));

% Barplots as in Felsenberg Paper
subplot(2,2,2)
yvalues = [1 2];
b=bar(mean(C(:,[1 2])),'FaceColor','flat');
b.CData(1,:) = [0.678 0.678 0.686];
b.CData(2,:) = [0.349 0.341 0.337];
set(gcf,'color','w');
hold on
SEM_C = std(C,[],1)/sqrt(size(C,1));
errorbar(yvalues,mean(C(:,[1 2])),SEM_C([1 2]),SEM_C([1 2]),'LineStyle','none','LineWidth',2.5,'CapSize',10,'Color','k'); 
plot(yvalues(1),C(:,1),'ko');
plot(yvalues(2),C(:,2),'ko');
ylim([-0.1 0.5])
xlim([0.5 2.5])
set(gca,'XTick',[1 2],'XTickLabel',{'Appetitive','Extinction'},'FontSize',10);
ylabel('Performance Index','FontSize',12);
title('B','Position',[0.15 0.52],'FontSize',12);
hold off
%Add significances
p1 = signrank(C(:,1),C(:,2));
yt = get(gca, 'YTick');
xt = get(gca, 'XTick');
hold on
[txt1] = CalcSign(p1);
plot(xt([1 2]), [1 1]*0.35, '-k')
text(mean(xt([1 2])), 0.4,txt1,'FontSize',12)
hold off

% Aversive and extinction learning

C_Type ='class2';     % class1 or class2 of Kenyon cells (higher connectivity)
train_trials =12 ;        % how  many training trials
Odor=1;
CSmin = 2;
OffSet=0;
number=15;
InputRs=[-1 0];%bestimme, ob aversiv (1) oder appetitiv(2) gelernt werden soll

Experiment='normal';

for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    MVP2InputAbs1(patterns)=MVP2InputAbs(Odor);
    M6InputAbs1(patterns)=M6InputAbs(Odor);
end

for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
    MVP2InputExt1(patterns)=MVP2InputExt(Odor);
    M6InputExt1(patterns)=M6InputExt(Odor);
end

%Boxplots for CS+ und CS-

subplot(2,2,3)
B(:,1) = PIabsolute1;
B(:,2) = PIabsolute2;
B(:,3) = PIextinction1;
B(:,4) = PIextinction2;
SEM_B = std(B,[],1)/sqrt(size(B,1)); 
boxplot(B(:,1:4),'Colors','k','Widths',0.9);
hold on
line(0:5,[0,0,0,0,0,0],'LineStyle',':','Color','black')
h = findobj(gca,'Tag','Box');
for i = [1 2]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.349 0.341 0.337],'FaceAlpha',.9,'LineStyle','none');
end
for i = [3 4]
    patch(get(h(i),'XData'),get(h(i),'YData'),[0.678 0.678 0.686],'FaceAlpha',.9,'LineStyle','none');
end
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'CS+', 'CS-','CS+', 'CS-'},'FontSize',10);
xlabel('Aversive    Extinction','FontSize',10)
ylabel('Preference Index','FontSize',12);
set(gcf,'color','w');
ylim([-0.5 0.1])
title('C','Position',[-0.7 0.15],'FontSize',12);

D(:,1) = (B(:,1))-(B(:,2));
D(:,2) = (B(:,3))-(B(:,4));

%Barplots as in Felsenberg Paper
subplot(2,2,4)
yvalues = [1 2];
b=bar(mean(D(:,[1 2])),'FaceColor','flat');
b.CData(1,:) = [0.678 0.678 0.686];
b.CData(2,:) = [0.349 0.341 0.337];
set(gcf,'color','w');
hold on
SEM_D = std(D,[],1)/sqrt(size(D,1));
errorbar(yvalues,mean(D(:,[1 2])),SEM_B([1 2]),SEM_B([1 2]),'LineStyle','none','LineWidth',2.5,'CapSize',10,'Color','k'); 
plot(yvalues(1),D(:,1),'ko');
plot(yvalues(2),D(:,2),'ko');
ylim([-0.5 0.1])
xlim([0.5 2.5])
set(gca,'XTick',[1 2],'XTickLabel',{'Aversive','Extinction'},'FontSize',10);
ylabel('Performance Index','FontSize',12);
title('D','Position',[0.14 0.15],'FontSize',12);
hold off
%Add significances
p2 = signrank(D(:,1),D(:,2));
yt = get(gca, 'YTick');
xt = get(gca, 'XTick');
hold on
[txt2] = CalcSign(p2);
plot(xt([1 2]), [1 1]*-0.4, '-k')
text(mean(xt([1 2])),-0.35,txt2,'FontSize',12)

hold off

%Save Data
save('BehavioralExpPrefIApp','A')
save('BehavioralExpPrefIAv','B')
save('BehavioralExpPerfIApp','C')
save('BehavioralExpPerfIAv','D')