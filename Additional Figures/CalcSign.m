function [txt] = CalcSign(p)
%Calculates Siginifcance Niveau depending on the p value
if p >=0.05
    txt='n.s.';
end
if p<=0.05 && p >0.01
    txt='*';
end
if p<=0.01 && p>0.001
    txt='**';
end
if p<=0.001
    txt='***';
end

end

