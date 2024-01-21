function y = op_translate(oldBest, newBest, SE, beta)
    n = length(oldBest);
    y = repmat(newBest', 1, SE) + beta / (norm(newBest - oldBest) + eps) * reshape(kron(rand(SE, 1), (newBest - oldBest)'), n, SE);
    y = y';

    % function y = op_rotate(Best, SE, alpha)
    %     n = length(Best);
    %     y = repmat(Best', 1, SE) + alpha * (1 / n / (norm(Best) + eps)) * reshape(unifrnd(-1, 1, SE * n, n) * Best', n, SE);
    %     y = y';
