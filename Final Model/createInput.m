 function [InputPatternsi] = createInput()
%create Input Patterns that simulate different odors
%in total, 6 odors are simulated
%For every odor patterns, 50 out of 100 PNs are activatesd
%Activation ranges between 0.2 and 0.8
%For odor 1, PNs 1-50 are activated
%For odors 2-6, other patterns with varying overlap to odor 1 are activated

InputPatternsi=zeros(100,6);
i=1:6;
for m = i; %for CS- 2 - 6
    k = 50:-10:0; %defines how many neurons overlap
    l = 0:10:50; %defines how many neurons not overlap
    u =51:100; % range of the non-overlapping, belongs to l
    o =randperm(50); %sorts 50 neurons in new order
        for o =o(1:k(m))%defines how many of the 50 1st neurons are activated, gets lower over time (->k)
            InputPatternsi(o,m)=(0.8-0.2).*rand(1)+0.2;
        end
    u=u(randperm(length(u)));
        for u =u(1:l(m));%defines how many of the last 50 neurons are activated, gets more over time (->l)
            InputPatternsi(u,m)=(0.8-0.2).*rand(1)+0.2;
        end
end
