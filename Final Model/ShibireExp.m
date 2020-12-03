%Author: Magdalena Springer, magdalena.springer@uni-koeln.de
%Shibire Experiment
%Appetitive and aversive extinction learning experiment 
%During odor reactivation, single neuron groups are blocked
%Experiments Results shown in Figure 6 in Springer et al (2020)

clear
C_Type ='class2'; 
train_trials =12 ;
Odor=1;
CSmin=2;
OdorMinus=2;
OffSet=0.4;
number=15;
Input = [1 3]
InputRs=[-1 0];  %determines odor valence code (-1=aversive, 0=neutral, 1=appetitive)

%AVERSIVE LEARNING

%%%block PAM DANs
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

Experiment='blockingPAM';
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

% blocking PPL1 Dans
Experiment='blockingPPL1';
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

%%%block M6 Neuron
Experiment='blockingM6';
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

% blocking MV2 Neuron
Experiment='blockingMV2';
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


%%%blocking V2
Experiment='blockingV2';
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
SEM_A = std(A,[],1)/sqrt(size(A,1)); 


%%%blocking MVP2
Experiment='blockingMVP2';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end

yvalues = [1 2 3];
A(:,25) = PIabsolute1;
A(:,26) = PIabsolute2;
A(:,27) = PIextinction1;
A(:,28) = PIextinction2;
A(:,25) = A(:,25) - A(:,26);
A(:,27) = A(:,27) - A(:,28);
SEM_A = std(A,[],1)/sqrt(size(A,1)); 

%blocking KC 100%
Experiment='blockingKC100';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end

yvalues = [1 2 3];
A(:,29) = PIabsolute1;
A(:,30) = PIabsolute2;
A(:,31) = PIextinction1;
A(:,32) = PIextinction2;
A(:,29) = A(:,29) - A(:,30);
A(:,31) = A(:,31) - A(:,32);
SEM_A = std(A,[],1)/sqrt(size(A,1)); 

%blocking KC 50%
Experiment='blockingKC50';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end
A(:,33) = PIabsolute1;
A(:,34) = PIabsolute2;
A(:,35) = PIextinction1;
A(:,36) = PIextinction2;
A(:,33) = A(:,33) - A(:,34);
A(:,35) = A(:,35) - A(:,36);
SEM_A = std(A,[],1)/sqrt(size(A,1)); 

%APPETITIVE LEARNING
%%%%%%SHIBIRE EXPERIMENT %%%%%%%%%%%%%%%%%%%%%%%%%

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

%blocking PAM
Experiment='blockingPAM';
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

% blocking PPL1 Dans
Experiment='blockingPPL1';
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


%blocking M6
Experiment='blockingM6';
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

%blocking MVP2
Experiment='blockingMV2';
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

%blocking V2
Experiment='blockingV2';
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
SEM_B = std(B,[],1)/sqrt(size(B,1)); 

%blocking MVP2
Experiment='blockingMVP2';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end

yvalues = [1 2 3];
B(:,25) = PIabsolute1;
B(:,26) = PIabsolute2;
B(:,27) = PIextinction1;
B(:,28) = PIextinction2;
B(:,25) = B(:,25) - B(:,26);
B(:,27) = B(:,27) - B(:,28);
SEM_B = std(B,[],1)/sqrt(size(B,1)); 

%blocking KC100
Experiment='blockingKC100';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end

yvalues = [1 2 3];
B(:,29) = PIabsolute1;
B(:,30) = PIabsolute2;
B(:,31) = PIextinction1;
B(:,32) = PIextinction2;
B(:,29) = B(:,29) - B(:,30);
B(:,31) = B(:,31) - B(:,32);
SEM_B = std(B,[],1)/sqrt(size(B,1)); 

%blocking KC50
Experiment='blockingKC50';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
end
B(:,33) = PIabsolute1;
B(:,34) = PIabsolute2;
B(:,35) = PIextinction1;
B(:,36) = PIextinction2;
B(:,33) = B(:,33) - B(:,34);
B(:,35) = B(:,35) - B(:,36);
SEM_B = std(B,[],1)/sqrt(size(B,1)); 

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
%
h=figure('units','centimeter','position',[20,9,17.2,14]);
subplot(2,1,2,'units','centimeter','position',[1.5,1,15,5.5]);
b=bar(nanmean(A(:,[1 3 7 11 15 19 23 27 31 35])),'FaceColor','flat');
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
set(gca,'YTick',[-0.6 -0.4 -0.2 0],'YTickLabel',{'-0.6','-0.4','-0.2','0'},'FontSize',10);
% yticks([0 -0.2 -0.4 -0.6])
% yticklabels({'0','y = 50','y = 100'})
set(gca,'XTick',[1:10],'XTickLabel',{'Absolute','Extinction','PAM','PPL1','M6','MV2','V2','MVP2','KC(100%)','KC(50%)'},'FontSize',8);
title('Aversive Conditioning','FontSize',12);
annotation('textbox',[0.01,0.46,0.06,0.05],'String','B','EdgeColor','None','FontSize',12,'FontWeight','bold');
ylabel('Performance Index','FontSize',12);
yvalues = [1:10]
errorbar(yvalues,mean(A(:,[1 3 7 11 15 19 23 27 31 35])),SEM_A([1 3 7 11 15 19 23 27 31 35]),SEM_A([1 3 7 11 15 19 23 27 31 35]),'LineStyle','none','LineWidth',2,'CapSize',10,'Color','k');
yt = get(gca, 'YTick');
xt = get(gca, 'XTick');
plot(xt([2 3]), [1 1]*-0.35, '-k')
text(mean(xt([2 3])),-0.32,txta1,'FontSize',10,'FontWeight','bold')
plot(xt([2 4]), [1 1]*-0.41, '-k')
text(mean(xt([2 4])),-0.38,txta2,'FontSize',10,'FontWeight','bold')
plot(xt([2 5]), [1 1]*-0.47, '-k')
text(mean(xt([2 5])),-0.44,txta3,'FontSize',10,'FontWeight','bold')
plot(xt([2 6]), [1 1]*-0.53, '-k')
text(mean(xt([2 6])),-0.50,txta4,'FontSize',10,'FontWeight','bold')
plot(xt([2 7]), [1 1]*-0.59, '-k')
text(mean(xt([2 7])),-0.56,txta5,'FontSize',10,'FontWeight','bold')
plot(xt([2 8]), [1 1]*-0.65, '-k')
text(mean(xt([2 8])),-0.62,txta6,'FontSize',10,'FontWeight','bold')
plot(xt([2 9]), [1 1]*-0.71, '-k')
text(mean(xt([2 9])),-0.68,txta7,'FontSize',10,'FontWeight','bold')
plot(xt([2 10]), [1 1]*-0.77, '-k')
text(mean(xt([2 9])),-0.74,txta8,'FontSize',10,'FontWeight','bold')

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
set(gca,'YTick',[0, 0.2 0.4 0.6],'YTickLabel',{'0','0.2','0.4','0.6'},'FontSize',10);
ylim([0 0.8])
ylabel('Performance Index','FontSize',12);
xlim([0.5 10.5])
title('Appetitive Conditioning','FontSize',12);
annotation('textbox',[0.01,0.93,0.06,0.05],'String','A','EdgeColor','None','FontSize',12,'FontWeight','bold');
errorbar(yvalues,mean(B(:,[1 3 7 11 15 19 23 27 31 35])),SEM_B([1 3 7 11 15 19 23 27 31 35]),SEM_B([1 3 7 11 15 19 23 27 31 35]),'LineStyle','none','LineWidth',2,'CapSize',10,'Color','k'); 
yt = get(gca, 'YTick');
xt = get(gca, 'XTick');
plot(xt([2 3]), [1 1]*0.32, '-k')
text(mean(xt([2 3])),0.35,txtb1,'FontSize',10,'FontWeight','bold')
plot(xt([2 4]), [1 1]*0.38, '-k')
text(mean(xt([2 4])),0.41,txtb2,'FontSize',10,'FontWeight','bold')
plot(xt([2 5]), [1 1]*0.44, '-k')
text(mean(xt([2 5])),0.47,txtb3,'FontSize',10,'FontWeight','bold')
plot(xt([2 6]), [1 1]*0.50, '-k')
text(mean(xt([2 6])),0.53,txtb4,'FontSize',10,'FontWeight','bold')
plot(xt([2 7]), [1 1]*0.56, '-k')
text(mean(xt([2 7])),0.59,txtb5,'FontSize',10,'FontWeight','bold')
plot(xt([2 8]), [1 1]*0.62, '-k')
text(mean(xt([2 8])),0.65,txtb6,'FontSize',10,'FontWeight','bold')
plot(xt([2 9]), [1 1]*0.68, '-k')
text(mean(xt([2 9])),0.71,txtb7,'FontSize',10,'FontWeight','bold')
plot(xt([2 10]), [1 1]*0.74, '-k')
text(mean(xt([2 10])),0.77,txtb8,'FontSize',10,'FontWeight','bold')

%save data
save('ShibirePubApp','B')
save('ShibirePubAv','A')