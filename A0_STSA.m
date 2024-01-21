function [tt, D, pathnum, Q, iter] = A0_STSA(startPoint, endPoint)
    shapes = A0_env3D(startPoint, endPoint);
    tic;
    nowPoint = startPoint;
    path = startPoint;
    SampleNumber = 50;
    candidate = [];
    D = 0;
    Q = 0;
    pr = 0;
    iter = 1;

%     while isempty(candidate)
%         candidate = op_expand_o([5 5 2.5], SampleNumber, 0.5);
%         candidate = A0_filterCandidate(candidate, shapes, nowPoint);
%         [candidate, prob] = A0_prob(candidate, shapes, endPoint);
%     end
% 
%     nextPoint = A0_findFarthestPoint(candidate, prob, endPoint);
%     %     scatter3(nowPoint(1, 1), nowPoint(1, 2), nowPoint(1, 3), 'red', '*');
%     % scatter3(candidate(:, 1), candidate(:, 2), candidate(:, 3), 'b', '.');
%     %     scatter3(nextPoint(1, 1), nextPoint(1, 2), nextPoint(1, 3), 'black', 'filled');
%     lastPoint = nowPoint;
%     D = D + A0_getDist(nowPoint, nextPoint);
%     nowPoint = nextPoint; % 转移到新路径点
%     path = [path; nextPoint];

    while ~isequal(nowPoint, endPoint) && iter < 50

        if pr < 99
            candidate = op_rotate(endPoint, nowPoint, SampleNumber, A0_getDist(nowPoint,endPoint)/4);
            candidateSize = size(candidate, 1);
            candidate = A0_filterCandidate(candidate, shapes, nowPoint); % 筛除被障碍物挡住或在障碍物中的点

            if size(candidate, 1) < candidateSize / 3 %如果路径点筛除过多，则使用伸缩搜索算子搜索路径点并筛选
                candidate = op_axes(nowPoint, SampleNumber, 0.5);
                candidateSize = size(candidate, 1);
                candidate = A0_filterCandidate(candidate, shapes, nowPoint);
            end

            if size(candidate, 1) < candidateSize / 3 %如果路径点筛除过多，则使用轴向搜索算子搜索路径点并筛选
                candidate = op_expand_o([10 10 2.5], SampleNumber, 0.5);
                candidate = A0_filterCandidate(candidate, shapes, nowPoint);
            end

            [candidate, prob] = A0_prob(candidate, shapes, endPoint);

            if size(candidate, 1) == 0
                iter = iter + 1;
                continue;
            end

            [nextPoint, pr] = A0_findFarthestPoint(candidate, prob, endPoint); %选择转移概率最大的点作为下一个点
        else
            nextPoint = endPoint;
        end

        scatter3(nowPoint(1, 1), nowPoint(1, 2), nowPoint(1, 3), 'red', '*');
        scatter3(candidate(:, 1), candidate(:, 2), candidate(:, 3), 'black', '.');
        scatter3(nextPoint(1, 1), nextPoint(1, 2), nextPoint(1, 3), 'black', 'filled');
        nowPoint = nextPoint;
        path = [path; nextPoint];
        iter = iter + 1;
    end

    tt = toc;
    path = [startPoint; path];
    plot3(path(:, 1), path(:, 2), path(:, 3), Color = 'r', LineWidth = 1);
    scatter3(path(:, 1), path(:, 2), path(:, 3), 'red', '*');
    pathnum = size(path, 1);

    for i = 1:pathnum - 1 % 遍历每一行
        D = D + A0_getDist(path(i, :), path(i + 1, :)); % 计算D并累加

        if i > 1
            Q = Q + A0_calcAngle(path(i - 1, :), path(i, :), path(i + 1, :)); % 计算Q并累加
        end

    end

    Q = Q / (pathnum * 180);
end

