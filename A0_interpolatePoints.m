function interpolated_points = A0_interpolatePoints(a, b)
    % Calculate the distance between the two points
    d = norm(b - a);

    if b == [6 16 1]
        st = 1;
    else
        st = 0.4;
    end

    if d < st
        interpolated_points = 10^-9;
    else
        % Calculate the number of interpolated points
        n = floor(d / st);

        % Calculate the step size for interpolation
        step = (b - a) / n;

        % Initialize the interpolated points array
        interpolated_points = zeros(n + 1, 3);

        % Interpolate the points
        for i = 1:n + 1
            interpolated_points(i, :) = a + (i - 1) * step;
        end

    end

end
