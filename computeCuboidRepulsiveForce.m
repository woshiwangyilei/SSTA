function F = computeCuboidRepulsiveForce(P, cubeVertices)

    % 拆分长方体为6个面
    faces = [1 2 3 4;
             5 6 7 8;
             1 2 6 5;
             2 3 7 6;
             3 4 8 7;
             5 1 4 8];

    d = inf;

    for i = 1:size(faces, 1)
        % 取出每个面的4个定点
        faceVertices = cubeVertices(faces(i, :), :);

        % 计算点到面的距离
        dist = pointToPlaneDist(P, faceVertices);

        % 记下最小距离
        if dist < d && dist > 0
            d = dist;
        end

    end

    % 按势场法公式计算斥力
    if d > 0.4
        F = 0;
    else
        F = 1 / d ^ 2;
    end

end

% 点到面距离计算函数
function dist = pointToPlaneDist(P, plane)

    % 求平面法向量
    v1 = plane(2, :) - plane(1, :);
    v2 = plane(3, :) - plane(1, :);
    n = cross(v1, v2);
    n = n / norm(n);

    % 点到面的距离加上法向量方向
    dist = dot(n, P - plane(1, :));

end
