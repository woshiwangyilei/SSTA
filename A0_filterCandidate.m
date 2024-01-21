function candidate = A0_filterCandidate(candidate, shapes, nowPoint)
    can = [];

    for i = 1:size(candidate, 1)
        breakFlag = 0;

        if ~inShape(shapes{1}, candidate(i, :)) %超出边界跳过
            continue;
        end

        for j = 2:size(shapes(:), 1)

            if inShape(shapes{j}, candidate(i, :)) %在立方体内部跳过
                breakFlag = 1;
                break;
            end

        end

        if breakFlag
            continue;
        end

        interpolated_points = A0_interpolatePoints(nowPoint, candidate(i, :));

        if interpolated_points ~= 10^-9

            for k = 1:size(interpolated_points, 1)

                for j = 2:size(shapes(:), 1)

                    if inShape(shapes{j}, interpolated_points(k, :)) %在立方体内部跳过

                        breakFlag = 1;
                        break;
                    end

                end

                if breakFlag
                    breakFlag = 11;
                    break;
                end

            end

        end

        if breakFlag == 11
            continue;
        end

        can = [can; candidate(i, :)];
    end

    candidate = can;
