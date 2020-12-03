%Author: Magdalena Springer, magdalena.springer@uni-koeln.de
%Learning Curve Experiment
%Associative and Extinction Learning Experiment with one network
%Recording all neuron activation rates over trials
%Experiments Results shown in Figure 4 in Springer et al (2020)

clear
C_Type ='class2'; 
train_trials = 12 ;
Odor=1;
CSmin = 2;
OffSet=0;
number=1;
Input = [1 3];
Experiment='normal';
rng(1)
s=rng

for patterns= 1:number
    %Set up input and brain
    [InputPatternsi] = createInput();
    InputPatterns = InputPatternsi(:,Input);
    MinNoise = 0.8;
    noise=(1-MinNoise).*rand(1)+MinNoise;
    InputPatterns=InputPatterns*noise;
    [C,W, W_MVP2,W_M6]=setupBrain(C_Type); % this sets up the connectivity and weights, it is not completely necessary but for the structure 
    InputRs=[0 0];
    %Testing the initial model once for Odor 1 /CS+
    PN = InputPatterns(:,1);
    R = InputRs(1);
    [R_KC, R_p,R_n,PAMDan,PPL1Dan,V2,M6] = processInput(PN, C, W, W_MVP2,W_M6,R,Odor,Experiment); % processes the PN through all the three layers and computes the PI for it
    PI = (R_p-R_n)./(R_n+R_p);
    if PI <-1
        PI=-1;
    end
    if PI> 1
        PI = 1;
    end
    
    PAMact(patterns,1)=PAMDan;
    PPL1act(patterns,1) =PPL1Dan;
    W_M6act(patterns,1) = sum(W_M6);
    W_MVP2act(patterns,1) =sum(W_MVP2);
    MBONposact(patterns,1)=R_p;
    MBONnegact(patterns,1)=R_n;
    PIact(patterns,1)=PI;
    V2act(patterns,1)=V2;
    M6act(patterns,1)=M6;
    Ract(1)=R;
    
    %learn appetitive
    InputRs=[1 0];
    for i = 1: train_trials
        %learning part
        for j = 1:length(InputPatterns(1,:))
            PN = InputPatterns(:,j);
            R = InputRs(j);
            [R_KC, MVP2,M6,PAMDan,PPL1Dan] = processInput(PN, C, W, W_MVP2,W_M6,R,Odor,Experiment); % processes the PN through all the three layers and computes the PI for it
            vPAM(j)=PAMDan;
            vPPL1(j) =PPL1Dan;
            [W_MVP2,W_M6] = updateWeight(PAMDan, PPL1Dan,  R_KC, Odor, W_MVP2, W_M6);
        %dont forget testing after every trial
            [R_KC, R_p,R_n,PAMDan,PPL1Dan,V2,M6] = processInput(PN, C, W, W_MVP2,W_M6,R,Odor,Experiment); % processes the PN through all the three layers and computes the PI for it
            PI(j) = (R_p-R_n)./(R_n+R_p);
            if PI(j) <-1
                PI(j)=-1;
            end
            if PI(j)> 1
                PI(j) = 1;
            end
            vW_M6(j) = sum(W_M6);
            vW_MVP2(j) =sum(W_MVP2);
            vMBONpos(j)=R_p;
            vMBONneg(j)=R_n;
            vV2(j)=V2;
            vM6(j)=M6;
        end
        PAMact(patterns,i+1)=vPAM(Odor);
        PPL1act(patterns,i+1) =vPPL1(Odor);
        W_M6act(patterns,i+1) = vW_M6(Odor);
        W_MVP2act(patterns,i+1) =vW_MVP2(Odor);
        MBONposact(patterns,i+1)=vMBONpos(Odor);
        MBONnegact(patterns,i+1)=vMBONneg(Odor);
        PIact(patterns,i+1)=PI(Odor);
        Ract(i+1)=InputRs(Odor);
        V2act(patterns,i+1)=vV2(Odor);
        M6act(patterns,i+1)=vM6(Odor);

    end
%%%NOW EXTINCTION%%%%%%%%%%%%
    noise=(1-MinNoise).*rand(1)+MinNoise;
    InputPatterns=InputPatterns*noise;
    PN=InputPatterns(:,Odor);
    InputRs(Odor)= 0;
    for i=1:train_trials
        for j = 1:length(InputPatterns(1,:))
            PN = InputPatterns(:,j);
            R = InputRs(j);
            [R_KC, MVP2,M6,PAMDan,PPL1Dan] = processInput(PN, C, W, W_MVP2,W_M6,R,Odor,Experiment); % processes the PN through all the three layers and computes the PI for it
            vPAM(j)=PAMDan;
            vPPL1(j) =PPL1Dan;
            [W_MVP2,W_M6] = updateWeight(PAMDan, PPL1Dan,  R_KC, Odor, W_MVP2, W_M6);
        %dont forget testing after every trial
            [R_KC, R_p,R_n,PAMDan,PPL1Dan,V2,M6] = processInput(PN, C, W, W_MVP2,W_M6,R,Odor,Experiment); % processes the PN through all the three layers and computes the PI for it
            PI(j) = (R_p-R_n)./(R_n+R_p);
            if PI(j) <-1
                PI(j)=-1;
            end
            if PI(j)> 1
                PI(j) = 1;
            end
            vW_M6(j) = sum(W_M6);
            vW_MVP2(j) =sum(W_MVP2);
            vMBONpos(j)=R_p;
            vMBONneg(j)=R_n;
            vV2(j)=V2;
            vM6(j)=M6;
        end
        PAMact(patterns,i+1+train_trials)=vPAM(Odor);
        PPL1act(patterns,i+1+train_trials) =vPPL1(Odor);
        W_M6act(patterns,i+1+train_trials) = vW_M6(Odor);
        W_MVP2act(patterns,i+1+train_trials) =vW_MVP2(Odor);
        MBONposact(patterns,i+1+train_trials)=vMBONpos(Odor);
        MBONnegact(patterns,i+1+train_trials)=vMBONneg(Odor);
        V2act(patterns,i+1+train_trials)=vV2(Odor);
        M6act(patterns,i+1+train_trials)=vM6(Odor);
        PIact(patterns,i+1+train_trials)=PI(Odor);
        Ract(i+1+train_trials)=InputRs(Odor);
    end
end

%%%%PLOTTING%%%%%%%%%%%%%%%
h=figure('units','centimeter','position',[6,6,17,13]);%Figure 1 
subplot(5,2,1)
plot(Ract(1:13),'-','Color','k');
hold on
plot(17:28,Ract(14:end),'-','Color','k');
line(0:25,zeros(26),'Color', [0.6 0.6 0.6],'LineStyle',':');
title('Appetitive learning','FontSize',12)
yl = sprintf('US');
ylabel(yl,'FontSize',10);
ylim([-1 1])
xlim([0 30])
set(gca,'XTick',[],'XColor','w')
set(gca,'box','off')

subplot(5,2,3)
plot((PAMact(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.25 0.83 0.56],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.25 0.83 0.56]);
hold on
plot((PPL1act(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[1 0.39 0.42],...
    'MarkerSize',4)%,'MarkerFaceColor',[1 0.39 0.42]);
plot(17:28,(PAMact(:,14:end)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.25 0.83 0.56],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.25 0.83 0.56]);
plot(17:28,(PPL1act(:,14:end)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[1 0.39 0.42],...
    'MarkerSize',4)%,'MarkerFaceColor',[1 0.39 0.42]);
line(0:25,zeros(26,1)+10^-2,'Color', [0.6 0.6 0.6],'LineStyle',':');
line(0:25,zeros(26,1)+1,'Color', [0.6 0.6 0.6],'LineStyle',':');
% text(22,0.6,'PAM','Color',[0.25 0.83 0.56],'FontSize',10);
% text(22,0.4,'PPL1','Color',[1 0.39 0.42],'FontSize',10);
%ylim([0 .3])
xlim([0 30])
set(gca,'XTick',[1 7 13 19],'XTickLabel',' ','YScale','Log')
yl = sprintf('log(DAN \nactivation)');
ylabel(yl,'FontSize',10);
set(gca,'box','off')


subplot(5,2,5)
plot((MBONposact(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.541 0.655 0.827],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.541 0.655 0.827]);
hold on
plot((MBONnegact(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.89 0.475 0.733],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.89 0.475 0.733]);
plot(17:28,(MBONposact(:,14:end)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.541 0.655 0.827],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.541 0.655 0.827]);
plot(17:28,(MBONnegact(:,14:end)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.89 0.475 0.733],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.89 0.475 0.733]);
line(0:25,zeros(26)+0.5,'Color', [0.6 0.6 0.6],'LineStyle',':');
line(0:25,zeros(26)+1,'Color', [0.6 0.6 0.6],'LineStyle',':');
% text(19.5,1.2,'MBON_p_o_s','Color',[0.541 0.655 0.827],'FontSize',10);
% text(19.5,0.95,'MBON_n_e_g','Color',[0.89 0.475 0.733],'FontSize',10);
ylim([0 1])
xlim([0 30])
set(gca,'XTick',[1 7 13 19],'XTickLabel',' ')
%ylabel('KC::MBON \newline input')
yl = sprintf('KC::MBON \ninput');
ylabel(yl,'FontSize',10);
set(gca,'box','off')



subplot(5,2,7)
plot((MBONposact(:,1:13)),'-^','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.541 0.655 0.827],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.541 0.655 0.827]);
hold on
plot((MBONnegact(:,1:13)),'-^','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.89 0.475 0.733],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.89 0.475 0.733]);
plot((V2act(:,1:13)),'-s','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.18 0.314 0.596],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.541 0.655 0.827]);
plot((M6act(:,1:13)),'-s','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.792 0.239 0.553],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.89 0.475 0.733]);
plot(17:28,(MBONposact(:,14:25)),'-^','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.541 0.655 0.827],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.541 0.655 0.827]);
plot(17:28,(MBONnegact(:,14:25)),'-^','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.89 0.475 0.733],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.89 0.475 0.733]);
plot(17:28,(V2act(:,14:25)),'-s','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.18 0.314 0.596],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.541 0.655 0.827]);
plot(17:28,(M6act(:,14:25)),'-s','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.792 0.239 0.553],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.89 0.475 0.733]);
% text(19.5,1.2,'MBON_p_o_s','Color',[0.541 0.655 0.827],'FontSize',10);
% text(19.5,0.95,'MBON_n_e_g','Color',[0.89 0.475 0.733],'FontSize',10);
ylim([0 1])
xlim([0 30])
set(gca,'XTick',[1 7 13 19],'XTickLabel',' ')
%ylabel('KC::MBON \newline input')
yl = sprintf('MBON \noutput');
ylabel(yl,'FontSize',10);
set(gca,'box','off')




subplot(5,2,9)%,'units','centimeter','position',[11,14.5,3.5,3.2]);
SEM_A = std(PIact,[],1)/sqrt(size(PIact,1)); 
plot((PIact(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.5 0.5 0.5],...
    'MarkerSize',4,'MarkerFaceColor',[0.5 0.5 0.5]);
hold on
plot(17:28,(PIact(:,14:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.5 0.5 0.5],...
    'MarkerSize',4,'MarkerFaceColor',[0.5 0.5 0.5]);
o=0.1;
for i=1:5
    line([0:25],zeros(26)+o,'Color', [0.6 0.6 0.6],'LineStyle',':')
    o=o+0.1;
    hold on
end
yvalues = [1:25];
set(gcf,'color','w');
set(gca,'box','off')
set(gca,'XTick',[2 7 13 17 23 28],'XTickLabel',{'1','6','12','1','6','12'});
set(gca,'YTick',[0.1 0.3],'FontSize',10);
% xlabel('Number of trials','FontSize',12);
%ylabel('Preference \newline Index','FontSize',12);
yl = sprintf('Preference \nIndex');
ylabel(yl,'FontSize',10);
xlabel('number of trials')
xlim([0 30])
ylim([0 0.35])

%%%Save Files
LearningCurveApp = 'LearningCurveApp.mat';
save(LearningCurveApp)

%%%AVERSIVE LEARNING%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
rng(1)
s=rng
C_Type ='class2';     % class1 or class2 of Kenyon cells (higher connectivity)
train_trials = 12 ;        % how  many training trials
Odor=1;
CSmin = 2;
OffSet=0;
number=1;
Input = [1 3];
Experiment='normal';

%%%%Hier zuerst das normale Lernen
for patterns= 1:number
    %Set up input and brain
    [InputPatternsi] = createInput();
    InputPatterns = InputPatternsi(:,Input);
    MinNoise = 0.8;
    noise=(1-MinNoise).*rand(1)+MinNoise;
    InputPatterns=InputPatterns*noise;
    [C,W, W_MVP2,W_M6]=setupBrain(C_Type); % this sets up the connectivity and weights, it is not completely necessary but for the structure 
    InputRs=[0 0];
    %Testing the initial model once for Odor 1 /CS+
    PN = InputPatterns(:,1);
    R = InputRs(1);
    [R_KC, R_p,R_n,PAMDan,PPL1Dan,V2,M6] = processInput(PN, C, W, W_MVP2,W_M6,R,Odor,Experiment); % processes the PN through all the three layers and computes the PI for it
    PI = (R_p-R_n)./(R_n+R_p);
    if PI <-1
        PI=-1;
    end
    if PI> 1
        PI = 1;
    end
    
    PAMact(patterns,1)=PAMDan;
    PPL1act(patterns,1) =PPL1Dan;
    W_M6act(patterns,1) = sum(W_M6);
    W_MVP2act(patterns,1) =sum(W_MVP2);
    MBONposact(patterns,1)=R_p;
    MBONnegact(patterns,1)=R_n;
    V2act(patterns,1)=V2;
    M6act(patterns,1)=M6;
    PIact(patterns,1)=PI;
    Ract(1)=R;
    
    %learn appetitive
    InputRs=[-1 0];
    for i = 1: train_trials
        %learning part
        for j = 1:length(InputPatterns(1,:))
            PN = InputPatterns(:,j);
            R = InputRs(j);
            [R_KC, MVP2,M6,PAMDan,PPL1Dan] = processInput(PN, C, W, W_MVP2,W_M6,R,Odor,Experiment); % processes the PN through all the three layers and computes the PI for it
            vPAM(j)=PAMDan;
            vPPL1(j) =PPL1Dan;
            [W_MVP2,W_M6] = updateWeight(PAMDan, PPL1Dan,  R_KC, Odor, W_MVP2, W_M6);
        %dont forget testing after every trial
            [R_KC, R_p,R_n,PAMDan,PPL1Dan,V2,M6] = processInput(PN, C, W, W_MVP2,W_M6,R,Odor,Experiment); % processes the PN through all the three layers and computes the PI for it
            PI(j) = (R_p-R_n)./(R_n+R_p);
            if PI(j) <-1
                PI(j)=-1;
            end
            if PI(j)> 1
                PI(j) = 1;
            end
            vW_M6(j) = sum(W_M6);
            vW_MVP2(j) =sum(W_MVP2);
            vMBONpos(j)=R_p;
            vMBONneg(j)=R_n;
            vV2(j)=V2;
            vM6(j)=M6;
        end
        PAMact(patterns,i+1)=vPAM(Odor);
        PPL1act(patterns,i+1) =vPPL1(Odor);
        W_M6act(patterns,i+1) = vW_M6(Odor);
        W_MVP2act(patterns,i+1) =vW_MVP2(Odor);
        MBONposact(patterns,i+1)=vMBONpos(Odor);
        MBONnegact(patterns,i+1)=vMBONneg(Odor);
        V2act(patterns,i+1)=vV2(Odor);
        M6act(patterns,i+1)=vM6(Odor);
        PIact(patterns,i+1)=PI(Odor);
        Ract(i+1)=InputRs(Odor);

    end
%%%NOW EXTINCTION%%%%%%%%%%%%
    noise=(1-MinNoise).*rand(1)+MinNoise;
    InputPatterns=InputPatterns*noise;
    PN=InputPatterns(:,Odor);
    InputRs(Odor)= 0;
    for i=1:train_trials
        for j = 1:length(InputPatterns(1,:))
            PN = InputPatterns(:,j);
            R = InputRs(j);
            [R_KC, MVP2,M6,PAMDan,PPL1Dan] = processInput(PN, C, W, W_MVP2,W_M6,R,Odor,Experiment); % processes the PN through all the three layers and computes the PI for it
            vPAM(j)=PAMDan;
            vPPL1(j) =PPL1Dan;
            [W_MVP2,W_M6] = updateWeight(PAMDan, PPL1Dan,  R_KC, Odor, W_MVP2, W_M6);
        %dont forget testing after every trial
            [R_KC, R_p,R_n,PAMDan,PPL1Dan,V2,M6] = processInput(PN, C, W, W_MVP2,W_M6,R,Odor,Experiment); % processes the PN through all the three layers and computes the PI for it
            PI(j) = (R_p-R_n)./(R_n+R_p);
            if PI(j) <-1
                PI(j)=-1;
            end
            if PI(j)> 1
                PI(j) = 1;
            end
            vW_M6(j) = sum(W_M6);
            vW_MVP2(j) =sum(W_MVP2);
            vMBONpos(j)=R_p;
            vMBONneg(j)=R_n;
            vV2(j)=V2;
            vM6(j)=M6;
        end
        PAMact(patterns,i+1+train_trials)=vPAM(Odor);
        PPL1act(patterns,i+1+train_trials) =vPPL1(Odor);
        W_M6act(patterns,i+1+train_trials) = vW_M6(Odor);
        W_MVP2act(patterns,i+1+train_trials) =vW_MVP2(Odor);
        MBONposact(patterns,i+1+train_trials)=vMBONpos(Odor);
        MBONnegact(patterns,i+1+train_trials)=vMBONneg(Odor);
        V2act(patterns,i+1+train_trials)=vV2(Odor);
        M6act(patterns,i+1+train_trials)=vM6(Odor);
        PIact(patterns,i+1+train_trials)=PI(Odor);
        Ract(i+1+train_trials)=InputRs(Odor);
    end
end

%%%%PLOTTING%%%%%%%%%%%%%%%
subplot(5,2,2)
pos = get(gca, 'Position');
xoffset = -0.05;
pos(1) = pos(1) + xoffset;
set(gca, 'Position', pos)
plot(Ract(1:13),'-','Color','k');
hold on
plot(17:28,Ract(14:end),'-','Color','k');
line(0:25,zeros(26),'Color', [0.6 0.6 0.6],'LineStyle',':');
title('Aversive learning','FontSize',12)
% yl = sprintf('Reinforcing \nsignal');
% ylabel(yl,'FontSize',10);
ylim([-1 1])
xlim([0 30])
set(gca,'XTick',[],'XColor','w')
set(gca,'box','off')

subplot(5,2,4)
pos = get(gca, 'Position');
xoffset = -0.05;
pos(1) = pos(1) + xoffset;
set(gca, 'Position', pos)
plot((PAMact(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.25 0.83 0.56],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.25 0.83 0.56]);
hold on
plot((PPL1act(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[1 0.39 0.42],...
    'MarkerSize',4)%,'MarkerFaceColor',[1 0.39 0.42]);
plot(17:28,(PAMact(:,14:end)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.25 0.83 0.56],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.25 0.83 0.56]);
plot(17:28,(PPL1act(:,14:end)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[1 0.39 0.42],...
    'MarkerSize',4)%,'MarkerFaceColor',[1 0.39 0.42]);
line(0:25,zeros(26,1)+10^-2,'Color', [0.6 0.6 0.6],'LineStyle',':');
line(0:25,zeros(26,1)+1,'Color', [0.6 0.6 0.6],'LineStyle',':');
% text(22,0.6,'PAM','Color',[0.25 0.83 0.56],'FontSize',10);
% text(22,0.4,'PPL1','Color',[1 0.39 0.42],'FontSize',10);
legend('PAM','PPL1','Location','northeast')
leg = findobj(gcf, 'Type', 'Legend');
pos = get(leg, 'Position');
xoffset = 0.15;
pos(1) = pos(1) + xoffset;
set(leg(1,1), 'Position', pos)
legend('boxoff')
%ylim([0 1])
xlim([0 30])
set(gca,'XTick',[1 7 13 19],'XTickLabel',' ','YScale','Log')
% yl = sprintf('DAN \nactivation');
% ylabel(yl,'FontSize',10);
set(gca,'box','off')


subplot(5,2,6)
pos = get(gca, 'Position');
xoffset = -0.05;
pos(1) = pos(1) + xoffset;
set(gca, 'Position', pos)
plot((MBONposact(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.541 0.655 0.827],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.541 0.655 0.827]);
hold on
plot((MBONnegact(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.89 0.475 0.733],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.89 0.475 0.733]);
plot(17:28,(MBONposact(:,14:end)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.541 0.655 0.827],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.541 0.655 0.827]);
plot(17:28,(MBONnegact(:,14:end)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.89 0.475 0.733],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.89 0.475 0.733]);
line(0:25,zeros(26)+0.5,'Color', [0.6 0.6 0.6],'LineStyle',':');
line(0:25,zeros(26)+1,'Color', [0.6 0.6 0.6],'LineStyle',':');
legend('MVP2/V2','MV2/M6','Location','northeast');
leg = findobj(gcf,'Type', 'Legend');
pos = get(leg(1),'Position');
xoffset = 0.15;
pos(1) = pos(1) + xoffset;
set(leg(1), 'Position', pos)
legend('boxoff')
% text(19.5,1.2,'MBON_p_o_s','Color',[0.541 0.655 0.827],'FontSize',10);
% text(19.5,0.95,'MBON_n_e_g','Color',[0.89 0.475 0.733],'FontSize',10);
ylim([0 1])
xlim([0 30])
set(gca,'XTick',[1 7 13 19],'XTickLabel',' ')
%ylabel('KC::MBON \newline input')
% yl = sprintf('KC::MBON \ninput');
% ylabel(yl,'FontSize',10);
set(gca,'box','off')


subplot(5,2,8)
pos = get(gca, 'Position');
xoffset = -0.05;
pos(1) = pos(1) + xoffset;
set(gca, 'Position', pos)
plot((MBONposact(:,1:13)),'-^','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.541 0.655 0.827],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.541 0.655 0.827]);
hold on
plot((MBONnegact(:,1:13)),'-^','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.89 0.475 0.733],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.89 0.475 0.733]);
plot((V2act(:,1:13)),'-s','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.18 0.314 0.596],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.541 0.655 0.827]);
plot((M6act(:,1:13)),'-s','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.792 0.239 0.553],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.89 0.475 0.733]);
plot(17:28,(MBONposact(:,14:25)),'-^','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.541 0.655 0.827],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.541 0.655 0.827]);
plot(17:28,(MBONnegact(:,14:25)),'-^','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.89 0.475 0.733],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.89 0.475 0.733]);
plot(17:28,(V2act(:,14:25)),'-s','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.18 0.314 0.596],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.541 0.655 0.827]);
plot(17:28,(M6act(:,14:25)),'-s','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.792 0.239 0.553],...
    'MarkerSize',4)%,'MarkerFaceColor',[0.89 0.475 0.733]);
line(0:25,zeros(26)+0.5,'Color', [0.6 0.6 0.6],'LineStyle',':');
line(0:25,zeros(26)+1,'Color', [0.6 0.6 0.6],'LineStyle',':');
line(0:25,zeros(26)+0.5,'Color', [0.6 0.6 0.6],'LineStyle',':');
line(0:25,zeros(26)+1,'Color', [0.6 0.6 0.6],'LineStyle',':');
% text(19.5,1.2,'MBON_p_o_s','Color',[0.541 0.655 0.827],'FontSize',10);
% text(19.5,0.95,'MBON_n_e_g','Color',[0.89 0.475 0.733],'FontSize',10);
ylim([0 1])
xlim([0 30])
legend('MVP2','MV2','V2','M6','NumColumns',1,'Location','northeast')
leg = findobj(gcf, 'Type', 'Legend');
clear pos
pos = get(leg(1), 'Position');
xoffset = 0.15;
pos(1) = pos(1) + xoffset;
set(leg(1), 'Position', pos);
legend('boxoff');
set(gca,'XTick',[1 7 13 19],'XTickLabel',' ')
% yl = sprintf('MBON \noutput');
% ylabel(yl,'FontSize',10);
set(gca,'box','off')


subplot(5,2,10)%,'units','centimeter','position',[11,14.5,3.5,3.2]);
pos = get(gca, 'Position');
xoffset = -0.05;
pos(1) = pos(1) + xoffset;
set(gca, 'Position', pos)
SEM_A = std(PIact,[],1)/sqrt(size(PIact,1)); 
plot((PIact(:,1:13)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.5 0.5 0.5],...
    'MarkerSize',4,'MarkerFaceColor',[0.5 0.5 0.5]);
hold on
plot(17:28,(PIact(:,14:25)),'-o','Color',[0.5,0.5,0.5],...
    'LineWidth',2,'MarkerEdgeColor',[0.5 0.5 0.5],...
    'MarkerSize',4,'MarkerFaceColor',[0.5 0.5 0.5]);
o=0.3;
for i=1:4
    line([0:25],zeros(26)-o,'Color', [0.6 0.6 0.6],'LineStyle',':')
    o=o-0.1;
    hold on
end
yvalues = [1:25];
set(gcf,'color','w');
set(gca,'box','off')
set(gca,'XTick',[2 7 13 17 23 28],'XTickLabel',{'1','6','12','1','6','12'});
set(gca,'YTick',[-0.3 -0.1],'FontSize',10);
% xlabel('Number of trials','FontSize',12);
%ylabel('Preference \newline Index','FontSize',12);
% yl = sprintf('Preference \nIndex');
% ylabel(yl,'FontSize',10);
xlabel('number of trials')
xlim([0 30])
ylim([-0.35 0])


%%%Save Files
LearningCurveAv = 'LearningCurveAv.mat';
save(LearningCurveAv)