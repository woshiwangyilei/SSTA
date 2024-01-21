function repulsiveForceMagnitude = A0_calculateRepulsiveForceMagnitude(point, boxLWH, boxCenter)
    % 输入参数:[1 4 5], [9.5 8 2.5]
    % point=[[9 8 2.5]]：三维点的坐标 [x, y, z]
    % boxLWH=[1 4 5]：长方体的长度
    % boxWidth：长方体的宽度
    % boxHeight：长方体的高度
    % boxCenter=[9.5 8 2.5]：长方体的中心坐标 [x, y, z]

    % 设置距离参数
    D = 1;
    % 计算点到长方体中心的距离
    delta_x = abs(point(1) - boxCenter(1));
    delta_y = abs(point(2) - boxCenter(2));
    delta_z = abs(point(3) - boxCenter(3));

    % 计算点到长方体表面的距离
    distance_x = max(0, delta_x - boxLWH(1) / 2);
    distance_y = max(0, delta_y - boxLWH(2) / 2);
    distance_z = max(0, delta_z - boxLWH(3) / 2);
    distance = norm([distance_x, distance_y, distance_z]);

    if distance <= D
        % 计算斥力大小
        repulsiveForceMagnitude = 1 / distance ^ 3;
    else
        repulsiveForceMagnitude = 0;
    end

end
