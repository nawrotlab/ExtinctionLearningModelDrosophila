%Author: Magdalena Springer, magdalena.springer@uni-koeln.de
%Shibire Experiment for Kenyon Cells Only
%Appetitive and aversive extinction learning experiment 
%During odor reactivation, varying portions of KCs are blocked
%Experiments Results shown in Additional Figure 1 in Springer et al (2020)

clear
C_Type ='class2';
train_trials =12 ;
Odor=1;
CSmin=2;
OdorMinus=2;
OffSet=0.4;
number=15;
Input = [1 3]

%AVERSIVE LEARNING
InputRs=[-1 0];  %determines odor valence code (-1=aversive, 0=neutral, 1=appetitive)

%control experiment
Experiment='normal';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end
A(:,1) = PIabsolute1;
A(:,2) = PIabsolute2;
A(:,3) = PIextinction1;
A(:,4) = PIextinction2;
A(:,1) = A(:,1) - A(:,2);
A(:,3) = A(:,3) - A(:,4);

Experiment='blockingKC100';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end

yvalues = [1 2 3];
A(:,5) = PIabsolute1;
A(:,6) = PIabsolute2;
A(:,7) = PIextinction1;
A(:,8) = PIextinction2;
A(:,5) = A(:,5) - A(:,6);
A(:,7) = A(:,7) - A(:,8);

SEM_A = std(A,[],1)/sqrt(size(A,1)); 

Experiment='blockingKC80';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end

yvalues = [1 2 3];
A(:,9) = PIabsolute1;
A(:,10) = PIabsolute2;
A(:,11) = PIextinction1;
A(:,12) = PIextinction2;
A(:,9) = A(:,9) - A(:,10);
A(:,11) = A(:,11) - A(:,12);
SEM_A = std(A,[],1)/sqrt(size(A,1)); 

Experiment='blockingKC70';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end

yvalues = [1 2 3];
A(:,13) = PIabsolute1;
A(:,14) = PIabsolute2;
A(:,15) = PIextinction1;
A(:,16) = PIextinction2;
A(:,13) = A(:,13) - A(:,14);
A(:,15) = A(:,15) - A(:,16);
SEM_A = std(A,[],1)/sqrt(size(A,1)); 

Experiment='blockingKC60';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end

yvalues = [1 2 3];
A(:,17) = PIabsolute1;
A(:,18) = PIabsolute2;
A(:,19) = PIextinction1;
A(:,20) = PIextinction2;
A(:,17) = A(:,17) - A(:,18);
A(:,19) = A(:,19) - A(:,20);
SEM_A = std(A,[],1)/sqrt(size(A,1)); 


Experiment='blockingKC50';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end

yvalues = [1 2 3];
A(:,21) = PIabsolute1;
A(:,22) = PIabsolute2;
A(:,23) = PIextinction1;
A(:,24) = PIextinction2;
A(:,21) = A(:,21) - A(:,22);
A(:,23) = A(:,23) - A(:,24);
SEM_A = std(A,[],1); 

%APPETITIVE LEARNING


InputRs=[1 0]; %determines odor valence code (-1=aversive, 0=neutral, 1=appetitive)

%control experiment
Experiment='normal';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end
B(:,1) = PIabsolute1;
B(:,2) = PIabsolute2;
B(:,3) = PIextinction1;
B(:,4) = PIextinction2;
B(:,1) = B(:,1) - B(:,2);
B(:,3) = B(:,3) - B(:,4);

Experiment='blockingKC100';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end

yvalues = [1 2 3];
B(:,5) = PIabsolute1;
B(:,6) = PIabsolute2;
B(:,7) = PIextinction1;
B(:,8) = PIextinction2;
B(:,5) = B(:,5) - B(:,6);
B(:,7) = B(:,7) - B(:,8);
SEM_B = std(B,[],1)/sqrt(size(B,1)); 

Experiment='blockingKC80';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end

yvalues = [1 2 3];
B(:,9) = PIabsolute1;
B(:,10) = PIabsolute2;
B(:,11) = PIextinction1;
B(:,12) = PIextinction2;
B(:,9) = B(:,9) - B(:,10);
B(:,11) = B(:,11) - B(:,12);
SEM_B = std(B,[],1)/sqrt(size(B,1)); 


Experiment='blockingKC70';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end

yvalues = [1 2 3];
B(:,13) = PIabsolute1;
B(:,14) = PIabsolute2;
B(:,15) = PIextinction1;
B(:,16) = PIextinction2;
B(:,13) = B(:,13) - B(:,14);
B(:,15) = B(:,15) - B(:,16);
SEM_B = std(B,[],1)/sqrt(size(B,1));

Experiment='blockingKC60';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end

yvalues = [1 2 3];
B(:,17) = PIabsolute1;
B(:,18) = PIabsolute2;
B(:,19) = PIextinction1;
B(:,20) = PIextinction2;
B(:,17) = B(:,17) - B(:,18);
B(:,19) = B(:,19) - B(:,20);
SEM_B = std(B,[],1)/sqrt(size(B,1)); 

Experiment='blockingKC50';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end

yvalues = [1 2 3];
B(:,21) = PIabsolute1;
B(:,22) = PIabsolute2;
B(:,23) = PIextinction1;
B(:,24) = PIextinction2;
B(:,21) = B(:,21) - B(:,22);
B(:,23) = B(:,23) - B(:,24);
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

%Figure
h=figure('units','centimeter','position',[20,9,8.6,8.6]);
subplot(2,1,2)
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
subplot(2,1,1)
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
xlim([0.5 7.5])
set(gca,'XTick',[1:7],'XTickLabel',{'  no odor \newlinereactivation','100%','80%','70%','60%','50%','0%'},'FontSize',8);
errorbar(yvalues,mean(B(:,[1 7 11 15 19 23 3])),SEM_B([1 7 11 15 19 23 3]),SEM_B([1 7 11 15 19 23 3]),'LineStyle','none','LineWidth',1,'CapSize',5,'Color','k'); 
yt = get(gca, 'YTick');
xt = get(gca, 'XTick');
title('Appetitive Conditioning','FontSize',10);

%save data
save('ShibireKCApp','B')
save('ShibireKCAv','A')
