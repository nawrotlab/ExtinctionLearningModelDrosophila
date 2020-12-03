% creates all the necessary parameters for the connections between the 3 layers
% of the bees olfactory learning system, introduced by Peng& Chittka
%initial weights: W, W_EN_p abd W_EN_n = 0.2, 
%C_Type must be 'class1' or 'class2', which indicates if they are kenyon
%cell class 1 = a lot of connections or KC class 2 : not so many
%connections

function [C,W,W_EN_p, W_EN_n] = setupBrain(C_Type)


%Parameters
C = zeros(2000,100); % connectivity Matrix PN-KC, can be class1 or class2, defines which cells even have a connection
g_0 = 0.2; % initial weight for W
[nRows,nCols] = size(C);

% define the amount of connections(C) from PN to KC and shuffle them
switch C_Type
    case'class1'
    r = randi([45 55],2000,1);
end

switch C_Type
    case'class2'
    r = randi([5 15],2000,1);
end

for i= 1:nRows
    m = C(i,:);
    m(1:r(i)) = 1;
   m=m(randperm(100));
   C(i,:)=m;
end 
W=C*0.2;
W_EN_p = ones(1,2000)*0.01; 
W_EN_n = ones(1,2000)*0.01;