% function y = op_rotate(nowBest,Best, SE,alpha)
% % 
% n = length(Best);
% R1 = 2*rand(SE,n)-1;
% R2 = 2*rand(SE,1)-1;
% y = repmat(Best,SE,1) + alpha*repmat(R2,1,n).*R1./repmat(sqrt(sum(R1.*R1,2)),1,n);
% end

function y = op_rotate(lastBest, nowBest, SE, alpha)

    n = length(nowBest);
    % R1 = 2*rand(SE,n)-1;
    % R2 = 2*rand(SE,1)-1;
    R11 = 2 * rand(SE, 1) - 1;
    R12 = rand(SE, 1);
    R13 = 2 * rand(SE, 1) - 1;
    R1 = [R11 R12 R13];
    R2 = rand(SE, 1);
    y = alpha * repmat(R2, 1, n) .* R1 ./ repmat(sqrt(sum(R1 .* R1, 2)), 1, n);

    v1 = [0 -1 0];
    v2 = nowBest - lastBest;

    nv1 = v1 / norm(v1);
    nv2 = v2 / norm(v2);

    if nv1 == nv2
        y = nowBest + y;
        return;
    end

    if norm(nv1 + nv2) == 0
        q = [0 0 0 0];
    else
        u = cross(nv1, nv2);
        u = u / norm(u);

        theta = acos(sum(nv1 .* nv2)) / 2;
        q = [cos(theta) sin(theta) * u];
    end

    R = [2 * q(1) .^ 2 - 1 + 2 * q(2) ^ 2 2 * (q(2) * q(3) + q(1) * q(4)) 2 * (q(2) * q(4) - q(1) * q(3));
       2 * (q(2) * q(3) - q(1) * q(4)) 2 * q(1) ^ 2 - 1 + 2 * q(3) ^ 2 2 * (q(3) * q(4) + q(1) * q(2));
       2 * (q(2) * q(4) + q(1) * q(3)) 2 * (q(3) * q(4) - q(1) * q(2)) 2 * q(1) ^ 2 - 1 + 2 * q(4) ^ 2];

    y = nowBest + y * R;

end
