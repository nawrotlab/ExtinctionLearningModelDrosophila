%Author: Magdalena Springer, magdalena.springer@uni-koeln.de
%Generalization Experiment
%Associative learning with 1 odor, testing for 5 odors with different
%PN activation patterns (80-0% similarity to learned odor)
%Experiments Results shown in Figure 2 C,D in Springer et al (2020)

clear
C_Type ='class2'; %PN::KC connectivity
train_trials =12 ; 
Odor=1;
CSmin=2
OffSet=0;
number=15;
InputRs=[1 0 0 0 0 0];  %determines odor valence code (-1=aversive, 0=neutral, 1=appetitive)
%---------------------------
%Create 2 input patterns (stimuli) and their Index for CS+/CS-, sodass D�ft immer gleich bleiben
Input = [1 2 3 4 5 6]

InputPatternsi=zeros(100,6);
i=1:6;
for m = i; %für CS- 2 bis 6
    k = [50 50 50 50 50 50]; %gibt an wieviele Neurone es overlap es gibt
    l = [0 0 0 0 0 0]; %gibt an wieviele nicht overlap Neurone es gibt
    u =51:100; % zeigt range des nicht overlap, gehört zu l
    o =randperm(50) %sortiert 50 neu
        for o =o(1:k(m))%bestimmt, welche von den 50 1sten Neurone aktiviert werden. Wird weniger, deswegen k
             InputPatternsi(o,m)=(1-0.5).*rand(1)+0.5;
        end
    u=u(randperm(length(u)));
        for u =u(1:l(m));%bestimmt, welche von den 50 letzten Neurone aktiviert werden. Wird mehr, deswegen l
             InputPatternsi(u,m)=(1-0.5).*rand(1)+0.5;

        end
end
InputPatterns = InputPatternsi

%%%create Input 
%Parameters
C = zeros(2000,100); % connectivity Matrix PN-KC, can be class1 or class2, defines which cells even have a connection
g_0 = 0.2/3; % initial weight for W
[nRows,nCols] = size(C);

% define the amount of connections(C) from PN to KC and shuffle them
r = randi([5 15],2000,1);
% r = randi(,2000,1);


for i= 1:nRows
    t = C(i,:);
    t(1:r(i)) = 1;
   t=t(randperm(100));
   C(i,:)=t;
end 


W = C.*(1/15)

KC = W*InputPatterns;
%inhibitory feedback on KC to generate R_KC
[rubish,idx]=sort(KC);
n=ceil(length(KC)/100*5);%n=100
R_KC=zeros(size(KC));

for i=1:length(InputPatterns(1,:))
    [rubish,idx]=sort(KC(:,i));
    top5pc(:,i)=idx(end-n+1:end);
    %R_KC(:,i)=top5pc(:,i);
end

for i=1:6
    for g=1:100
        test= top5pc(g,i)
        R_KC(test,i) = KC(test,i)
%         if R_KC(test,i) >1
%             R_KC(test,i)=1
%         end
    end
end
        
num = 1
for f = 1:length(R_KC)
        if R_KC(f,1) >0
            R_KCpl(num,:) = R_KC(f,:);
            num = num+1
        end
end


%create Colormap for Heatmap
r = linspace(1,0,100)
g = linspace(1,0.447,100)
b = linspace(1,0.741,100)
cmap = zeros(100,3)
cmap(1:100,1)=r
cmap(1:100,2)=g
cmap(1:100,3)=b





fig = figure('units','centimeter','position',[20,9,22,23]);
subplot(1,2,1);
h = heatmap(InputPatterns,'FontSize',18,'ColorLimits',[0 1],'ColorbarVisible','off','Colormap',cmap);
h.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''}
h.XDisplayLabels = {'CS+','80%','60%','40%','20%','0%'}
h.YLabel = 'Projection Neuron Activity';
subplot(1,2,2);
i = heatmap(R_KCpl,'FontSize',18,'ColorLimits',[0 1],'Colormap',cmap);
i.YDisplayLabels = {'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''}
i.YLabel = 'Kenyon Cell Activity';
i.XDisplayLabels = {'CS+','80%','60%','40%','20%','0%'}
savefig(fig,'GeneralizationHeatmap.fig')
close(fig)

%%%
Experiment='normal';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIabsolute3(patterns)=PIabs(3);
    PIabsolute4(patterns)=PIabs(4);
    PIabsolute5(patterns)=PIabs(5);
    PIabsolute6(patterns)=PIabs(6);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
    PIextinction3(patterns)=PIext(3);
    PIextinction4(patterns)=PIext(4);
    PIextinction5(patterns)=PIext(5);
    PIextinction6(patterns)=PIext(6);
end
A(:,1) = PIabsolute1;
A(:,2) = PIabsolute2;
A(:,3) = PIabsolute3;
A(:,4) = PIabsolute4;
A(:,5) = PIabsolute5;
A(:,6) = PIabsolute6;
B(:,1) = PIextinction1;
B(:,2) = PIextinction2;
B(:,3) = PIextinction3;
B(:,4) = PIextinction4;
B(:,5) = PIextinction5;
B(:,6) = PIextinction6;



h = figure('units','centimeter','position',[18,12,16,21]);%Figure 1 ,
subplot(2,1,1)
SEM_A = std(A,[],1)/sqrt(size(A,1)); 
boxplot(A(:,1:6),'Colors','rkkkkk','Widths',0.7);
hold on 
set(findobj(gca,'type','line'),'linew',2)
line(0:7,[0,0,0,0,0,0,0,0],'LineStyle',':','Color','black')
title('Appetitive Learning');
xlabel('CS+ / CS- overlap')
ylabel('Preference Index');
set(gcf,'color','w');
set(gca,'XTick',[1 2 3 4 5 6],'XTickLabel',{'CS+ ', '80%','60%','40%','20%','0%'},'FontSize',15);
ylim([-0.2 0.6])
hold off

%%Aversive Learning
C_Type ='class2';     % class1 or class2 of Kenyon cells (higher connectivity)
train_trials =12 ;        % how  many training trials
Odor=1;
CSmin=2
OffSet=0;
number=15;
InputRs=[-1 0 0 0 0 0]; %bestimme, ob aversiv (1) oder appetitiv(2) gelernt werden soll
Input = [1 2 3 4 5 6]

Experiment='normal';
for patterns= 1:number
    [PIabs,PIext,MVP2InputAbs,M6InputAbs,MVP2InputExt,M6InputExt] = ExtinctionLearning(C_Type,train_trials,Odor,OffSet,Experiment,Input,InputRs);
    PIabsolute1(patterns)=PIabs(Odor);
    PIabsolute2(patterns)=PIabs(CSmin);
    PIabsolute3(patterns)=PIabs(3);
    PIabsolute4(patterns)=PIabs(4);
    PIabsolute5(patterns)=PIabs(5);
    PIabsolute6(patterns)=PIabs(6);
    PIextinction1(patterns)=PIext(Odor);
    PIextinction2(patterns)=PIext(CSmin);
    PIextinction3(patterns)=PIext(3);
    PIextinction4(patterns)=PIext(4);
    PIextinction5(patterns)=PIext(5);
    PIextinction6(patterns)=PIext(6);
end
E(:,1) = PIabsolute1;
E(:,2) = PIabsolute2;
E(:,3) = PIabsolute3;
E(:,4) = PIabsolute4;
E(:,5) = PIabsolute5;
E(:,6) = PIabsolute6;
D(:,1) = PIextinction1;
D(:,2) = PIextinction2;
D(:,3) = PIextinction3;
D(:,4) = PIextinction4;
D(:,5) = PIextinction5;
D(:,6) = PIextinction6;




subplot(2,1,2)
SEM_A = std(E,[],1)/sqrt(size(E,1)); 
boxplot(E,'Colors','rkkkkk','Widths',0.7);
hold on
set(findobj(gca,'type','line'),'linew',2)
line(0:7,[0,0,0,0,0,0,0,0],'LineStyle',':','Color','black')
title('Aversive Learning');
xlabel('CS+ / CS- overlap')
ylabel('Preference Index');
set(gcf,'color','w');
set(gca,'XTick',[1 2 3 4 5 6],'XTickLabel',{'CS+ ', '80%','60%','40%','20%','0%'},'FontSize',15);
ylim([-0.6 0.2])
hold off

%Save Data
save('GeneralizationApp','A')
save('GeneralizationAv','E')