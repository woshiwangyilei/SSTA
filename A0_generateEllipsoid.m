function shape = A0_generateEllipsoid(x, y, z, a, b, c, Rotate, sf)

    % 生成椭圆体网格
    [X, Y, Z] = ellipsoid(0, 0, 0, a, b, c);

    % 构造旋转矩阵
    % theta = theta*pi/180;
    % R = [cos(theta) -sin(theta) 0;
    %      sin(theta) cos(theta) 0;
    %      0 0 1];
    R = [cosd(Rotate) -sind(Rotate) 0; sind(Rotate) cosd(Rotate) 0; 0 0 1];
    % 旋转椭圆体
    XYZ = [X(:) Y(:) Z(:)] * R;
    X = reshape(XYZ(:, 1), size(X));
    Y = reshape(XYZ(:, 2), size(Y));
    Z = reshape(XYZ(:, 3), size(Z));

    % 平移到指定位置
    X = X + x;
    Y = Y + y;
    Z = Z + z;
    X = X(:);
    Y = Y(:);
    Z = Z(:);
    % 生成网格
    shape = alphaShape(X, Y, Z, sf);
    plot(shape, 'EdgeColor', [0.5 0.5 0.5], 'EdgeAlpha', '0.5', 'FaceColor', [0.5 0.5 0.5], 'FaceAlpha', 0.5);
end
