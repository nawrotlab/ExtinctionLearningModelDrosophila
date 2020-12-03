function [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt,M6abs,M6ext,PAM,PPL1,WeightM6,WeightMVP2] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs)
% Script performs learning protocol
%Script is divided in associative and extinction learning protocol
%Both parts consist out of learning and testing part

%Set up Input
[InputPatternsi] = createInput();
InputPatterns = InputPatternsi(:,Input);
MinNoise = 0.8;
noise=(1-MinNoise).*rand(1)+MinNoise;
InputPatterns=InputPatterns*noise;


%Set up Brain
[C,W, W_MVP2,W_M6]=setupBrain(C_Type); % this sets up the connectivity and weights, it is not completely necessary but for the structure 
% PN=InputPatterns(:,Odor);

Experiment0='normal';

%learn
for i = 1: train_trials
    for j = 1:length(InputPatterns(1,:));
    PN = InputPatterns(:,j);
    R = InputRs(j);
    [R_KC, MVP2,M6,PAMDan,PPL1Dan] = processInput(PN, C, W, W_MVP2,W_M6,R,Odor,Experiment0); % processes the PN through all the three layers and computes the PI for it
    [W_MVP2,W_M6] = updateWeight(PAMDan, PPL1Dan,  R_KC, Odor, W_MVP2, W_M6);
    end
end

%testing
    for patterns = 1:length(InputPatterns(1,:));
    PN = InputPatterns(:,patterns);
    R = InputRs(patterns);
    [R_KC, R_p,R_n,PAMDan,PPL1Dan] = processInput(PN, C, W, W_MVP2,W_M6,R,Odor,Experiment0); % processes the PN through all the three layers and computes the PI for it
    MVP2InputAbs(patterns)=R_p;
    M6InputAbs(patterns)=R_n;
    MVP2abs(patterns)=R_p;
    PAM(patterns)=PAMDan;
    PPL1(patterns) =PPL1Dan;
    M6abs(patterns)=R_n;
    PIabs(patterns) = (MVP2abs(patterns)-M6abs(patterns))./(M6abs(patterns)+MVP2abs(patterns))-OffSet;
    if PIabs(patterns) <-1
        PIabs(patterns)=-1;
end
if PIabs(patterns)> 1
    PIabs(patterns) = 1;
end
end


PIabs1=(MVP2abs(1)-M6abs(1))/(M6abs(1)+MVP2abs(1))-OffSet;
if PIabs1 <-1
    PIabs1=-1;
end
PIabs2=(MVP2abs(2)-M6abs(2))/(M6abs(2)+MVP2abs(2))-OffSet;
if PIabs2 <-1
    PIabs2=-1;
end

WeightM6 = sum(W_M6);
WeightMVP2 =sum(W_MVP2);

%%%
%Extinction Learning part
%%%

noise=(1-MinNoise).*rand(1)+MinNoise;
InputPatterns=InputPatterns*noise;
PN=InputPatterns(:,Odor);

%Now we set the valence of our learned odor to 0 (no reinforcement)
InputRs(Odor)= 0; 
     
%learn
for i = 1: train_trials
    for j = 1:length(InputPatterns(1,:));
    PN = InputPatterns(:,Odor);
    R = InputRs(Odor);
    [R_KC, MVP2,M6,PAMDan,PPL1Dan] = processInput(PN, C, W, W_MVP2,W_M6,R,Odor,Experiment); % processes the PN through all the three layers and computes the PI for it
    switch Experiment
        case'blockingPAM'
        PAMDan(Odor)=0;
      end
    switch Experiment
        case'blockingPPL1'
        PPL1Dan(Odor)=0;
    end
    [W_MVP2,W_M6] = updateWeight(PAMDan, PPL1Dan,  R_KC, Odor, W_MVP2, W_M6);
    end
end

%testing
for patterns = 1:size(InputPatterns,2)
    PN = InputPatterns(:,patterns);
    % genereating KC as a product out of PN and the W (weights)
    [R_KC, R_p,R_n,PAMDan,PPL1Dan] = processInput(PN, C, W, W_MVP2,W_M6,InputRs,Odor,Experiment0);
    MVP2InputExt(patterns)=R_p;
    M6InputExt(patterns)=R_n;
    MVP2ext(patterns)=R_p;
    % M6ext(patterns)=R_n-(0.5*R_p);
    M6ext(patterns)=R_n;
    if M6ext(patterns) < 0 
       M6ext(patterns) = 0;
    end
    PIext(patterns) = (MVP2ext(patterns)-M6ext(patterns))./(M6ext(patterns)+MVP2ext(patterns))-OffSet;
    if PIext(patterns) <-1
        PIext(patterns)=-1;
    end
    if PIext(patterns)> 1
        PIext(patterns) = 1;
    end
end



PIext1=(MVP2ext(1)-M6ext(1))/(M6ext(1)+MVP2ext(1))-OffSet;
if PIext1 <-1
    PIext1=-1;
end
PIext2=(MVP2ext(2)-M6ext(2))/(M6ext(2)+MVP2ext(2))-OffSet;
if PIext2 <-1
    PIext2=-1;
end
end