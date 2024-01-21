function y = op_axes(Best, SE, delta)
    % ×ø±êËÑË÷
    n = length(Best);
    A = zeros(n, SE);
    index = randi([1, n], 1, SE);
    A(n * (0:SE - 1) + index) = 1;
    y = repmat(Best', 1, SE) + delta * normrnd(0, 1, n, SE) .* A .* repmat(Best', 1, SE);
    y = y';
