function y = op_expand_o(Best, SE, gamma)

    n = length(Best);
    y = repmat(Best', 1, SE) + gamma * (normrnd(0, 1, n, SE)).* repmat(Best', 1, SE);
    y = y';
