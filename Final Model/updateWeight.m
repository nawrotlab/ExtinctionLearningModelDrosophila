
function[W_MVP2,W_M6] = updateWeight(PAMDan, PPL1Dan,  R_KC, Odor, W_MVP2, W_M6)
% this function checks the reward and then updates the weights in
% Weight matrixes
%if KC and DAN are acitve, weight matrix is downregulated
%if W_MBON gets <0, W_MBON is set to 0.

value =0.0045;

for i = 1: size(W_M6,2)
    if PAMDan > 0 && R_KC(i) >0
        W_M6(i) = W_M6(i) - ((PAMDan*value));
        if W_M6(i) < 0
            W_M6(i) = 0;
        end
    end
end


for i = 1: size(W_MVP2,2)
    if PPL1Dan > 0 && R_KC(i) >0
        W_MVP2(i) = W_MVP2(i) - ((PPL1Dan*value));
        if W_MVP2(i) < 0
            W_MVP2(i) = 0;
        end
    end
end

