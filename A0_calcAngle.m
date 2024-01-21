function angle = A0_calcAngle(a, b, c)

    % 输入为三个点的坐标

    % 计算两个向量
    vector_ab = b - a;
    vector_bc = c - b;

    % 归一化向量
    unit_ab = vector_ab / norm(vector_ab);
    unit_bc = vector_bc / norm(vector_bc);

    % 计算向量夹角的cos值
    cos_angle = dot(unit_ab, unit_bc);

    % 根据cos值判断夹角
    if cos_angle < -0.99999
        angle_rad = pi;
    elseif cos_angle > 0.99999
        angle_rad = 0;
    else
        angle_rad = acos(cos_angle);
    end

    % 将弧度转换为角度
    angle = rad2deg(angle_rad);

end
