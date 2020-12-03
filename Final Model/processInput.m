function [R_KC, R_p,R_n,PAMDan,PPL1Dan,V2,M6] = processInput(PN, C, W,W_EN_p, W_EN_n,InputRs,Odor,Experiment)
% processing Odor and reinforcing Input through all neuron layers  
% genereating KC as a product out of PN and the W (weights)
% generating MBONs as a product of KC and W
% generating DAN activation rates out of MBON activation and reinforcer


KC = W*PN;

for j=1:2000
      if KC(j)>1
          KC(j)=1;
      end
end

%inhibitory feedback on KC to generate R_KC
[rubish,idx]=sort(KC);
n=ceil(length(KC)/100*5);
top5pc=idx(end-n+1:end);
R_KC=zeros(size(KC));
R_KC(top5pc)=1;

for i=1:length(R_KC)
    if R_KC(i)==1 && KC(i)>0
        R_KC(i)=KC(i);
    end
end

switch Experiment
   case'blockingKC50'
   KCidx = randperm(2000);
   R_KC(KCidx(1:1000))=0;
end

switch Experiment
   case'blockingKC55'
   KCidx = randperm(2000);
   R_KC(KCidx(1:1100))=0;
end

switch Experiment
   case'blockingKC60'
   KCidx = randperm(2000);
   R_KC(KCidx(1:1200))=0;
end

switch Experiment
   case'blockingKC70'
   KCidx = randperm(2000);
   R_KC(KCidx(1:1400))=0;
end

switch Experiment
   case'blockingKC80'
   KCidx = randperm(2000);
   R_KC(KCidx(1:1600))=0;
end

switch Experiment
   case'blockingKC100'
   R_KC=R_KC*0;
end

%generate R_p/ R_n as a product of R_KC and W_EN_p/ W_EN_n
MVP2 = W_EN_p* R_KC;
V2 = W_EN_p* R_KC;
M6 = W_EN_n* R_KC;
MV2 = W_EN_n* R_KC;

V2in =  0.6 ./ (1+200*exp(-MV2*(15)));
M6in =  0.6 ./ (1+200*exp(-MVP2*(15)));
V2 = V2 - V2in;
M6 = M6 - M6in;

if V2<0
    V2=0;
end
if M6<0
    M6=0;
end

switch Experiment
    case'blockingV2'
    V2=0;
end

switch Experiment
    case'blockingMVP2'
    MVP2=0;
end

switch Experiment
    case'blockingMV2'
    MV2=0;
end

switch Experiment
   case'blockingM6'
   M6=0;
end

%neue Berechnung der DANs. Einfluss immer von InputR und MBONs

if InputRs==1
    InputPAM = 0.3+M6;
    InputPPL1 = V2*0.8;
end

if InputRs ==0
    InputPAM = 0+M6;
    InputPPL1 = 0+V2;
end
    
if InputRs == -1
    InputPAM = M6*0.8;
    InputPPL1 = 0.3+V2;
end

PAMDan = 1 / (1+10000*exp(-InputPAM*(19)));
PPL1Dan = 1 / (1+10000*exp(-InputPPL1*(19)));
KC = W*PN;
for j=1:2000
      if KC(j)>1
          KC(j)=1;
      end
end
%inhibitory feedback on KC to generate R_KC
[rubish,idx]=sort(KC);
n=ceil(length(KC)/100*5);
top5pc=idx(end-n+1:end);
R_KC=zeros(size(KC));
R_KC(top5pc)=1;

for i=1:length(R_KC)
    if R_KC(i)==1 && KC(i)>0
        R_KC(i)=KC(i);
    end
end

R_p = W_EN_p* R_KC;
R_n = W_EN_n* R_KC;
end 