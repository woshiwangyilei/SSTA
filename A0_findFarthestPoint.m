function [nextPoint, pr] = A0_findFarthestPoint(candidate, prob, endPoint)
    numPoints = size(candidate, 1);
    %     maxDist = -Inf;
    % minDist = Inf;
    %     nextPoint = endPoint;
    pr = prob(1);
    nextPoint = candidate(1, :);
    %     if pr==99
    %         return
    %     end
    for i = 1:numPoints
        %         distToStart = A0_getDist(candidate(i, :),startPoint);
        distToEnd = A0_getDist(candidate(i, :), endPoint);

        if distToEnd < 1
            nextPoint = endPoint;
        elseif pr < prob(i)
            pr = prob(i);
            nextPoint = candidate(i, :);
        end

        %         if distToStart > maxDist && distToEnd < minDist
        %             maxDist = distToStart;
        %             minDist = distToEnd;
        %             nextPoint = candidate(i, :);
        %         end

        %         if distToEnd < minDist
        %             minDist = distToEnd;
        %             nextPoint = candidate(i, :);
        %         end

    end

end
