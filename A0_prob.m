function [candidate, prob] = A0_prob(candidate, shapes, endPoint)
    can = [];
    prob = [];
    %     di = D+A0_getDist(nowPoint, endPoint);

    for i = 1:size(candidate, 1)
        %         rp = 0;
        interpolated_points = A0_interpolatePoints(endPoint, candidate(i, :));

        if interpolated_points ~= 10^-9
            p = 0;

            for k = 1:size(interpolated_points, 1)
                %scatter3(interpolated_points(k, 1), interpolated_points(k, 2), interpolated_points(k, 3), 'green', '.');

                for j = 2:size(shapes(:), 1)

                    if inShape(shapes{j}, interpolated_points(k, :)) %在立方体内部跳过
                        %scatter3(interpolated_points(k, 1), interpolated_points(k, 2), interpolated_points(k, 3), 'red', '.');
                        p = p + 1;
                    end

                end

            end

            %                         for j = 2:7
            %                             rp = rp + computeCuboidRepulsiveForce(candidate(i, :), shapes{j}.Points);
            %
            %                         end

            lp = 1 - (p / size(interpolated_points, 1));
            dp = 1 / A0_getDist(candidate(i, :), endPoint);
            %             rf=A0_calculateRepulsiveForceMagnitude(point, shapes{j}.boxLWH, boxCenter);

            %             scatter3(candidate(i, 1), candidate(i, 2), candidate(i, 3), 'r', '.');

            if p == 0
                prob = [prob; 99 + dp * 15];

            else
                prob = [prob; lp + dp * 5];
            end

        end

        can = [can; candidate(i, :)];
    end

    candidate = can;
