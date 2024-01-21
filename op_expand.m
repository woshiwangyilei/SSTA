% function y = op_expand(Best,SE,gamma)
%
% n = length(Best);
% y = repmat(Best',1,SE) + gamma*(normrnd(0,1,n,SE).*repmat(Best',1,SE));
% y = y';

function y = op_expand(oldBest, newBest, SE, gamma)
    a = (newBest + oldBest) ./ 2;
    a = a + [2 -2 2];
    n = length(newBest);
    y = repmat(a', 1, SE) + gamma * (normrnd(0, 1, n, SE) .* repmat((a)', 1, SE));
    y = y';
