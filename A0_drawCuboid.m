function shape = A0_drawCuboid(sizec, centerPoint, Rotate, EdgeColor, FaceAlpha)

    % 生成立方体
    x = [-sizec(1) / 2 sizec(1) / 2 sizec(1) / 2 -sizec(1) / 2 -sizec(1) / 2 sizec(1) / 2 sizec(1) / 2 -sizec(1) / 2];
    y = [-sizec(2) / 2 -sizec(2) / 2 sizec(2) / 2 sizec(2) / 2 -sizec(2) / 2 -sizec(2) / 2 sizec(2) / 2 sizec(2) / 2];
    z = [sizec(3) / 2 sizec(3) / 2 sizec(3) / 2 sizec(3) / 2 -sizec(3) / 2 -sizec(3) / 2 -sizec(3) / 2 -sizec(3) / 2];

    % 旋转
    R = [cosd(Rotate) -sind(Rotate) 0; sind(Rotate) cosd(Rotate) 0; 0 0 1];
    coords = [x; y; z];
    coords = R * coords;
    x = coords(1, :);
    y = coords(2, :);
    z = coords(3, :);

    % 移动中心点
    x = x + centerPoint(1);
    y = y + centerPoint(2);
    z = z + centerPoint(3);

    if Rotate == 80
        shape = alphaShape(x', y', z', 4);
    elseif sizec(2) == 1.4
        shape = alphaShape(x', y', z', 5);
    else
        shape = alphaShape(x', y', z');
    end

    %     if sizec == [1 4 3.5] %#ok<BDSCA>
    %         plot(shape, 'EdgeColor', 'red', 'FaceColor', 'red', 'FaceAlpha', 1);
    %     else
    %
%     if sizec(1) ~= 20
%         plot(shape, 'EdgeColor', EdgeColor, 'FaceColor', EdgeColor, 'FaceAlpha', FaceAlpha, 'EdgeAlpha', FaceAlpha);
%     end

    %
    %     end
