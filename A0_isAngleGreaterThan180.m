function result = A0_isAngleGreaterThan180(a, b, c)
    ab = b - a; % vector from a to b
    ac = c - a; % vector from a to c
    angle = atan2d(norm(cross(ab, ac)), dot(ab, ac)); % calculate angle in degrees

    if angle > 90
        result = 1;
    else
        result = 0;
    end

end
