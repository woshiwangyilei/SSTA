clc
clear
startPoint = [2 2 2];
endPoint = [6 16 1];
shapes = A0_env3D(startPoint, endPoint);

tic;
nowPoint = startPoint;
path = [];
SampleNumber = 100;
candidate = [];
D = 0;
Q = 0;
pr = 0;
% 使用伸缩搜索算子搜索路径点并筛除被障碍物挡住或在障碍物中的点
while isempty(candidate)
    candidate = op_expand(nowPoint, endPoint, 500, 0.5);
    candidate = A0_filterCandidate(candidate, shapes, nowPoint);
    [candidate, prob] = A0_prob(candidate, shapes, endPoint);
end

nextPoint = A0_findFarthestPoint(candidate, prob, endPoint);
ip = A0_interpolatePoints(nowPoint, nextPoint);
scatter3(nowPoint(1, 1), nowPoint(1, 2), nowPoint(1, 3), 'red', '*');
scatter3(candidate(:, 1), candidate(:, 2), candidate(:, 3), 'b', '.');
scatter3(nextPoint(1, 1), nextPoint(1, 2), nextPoint(1, 3), 'black', 'filled');
lastPoint = nowPoint;
D = D + A0_getDist(nowPoint, nextPoint);
nowPoint = nextPoint; % 转移到新路径点
path = [path; ip];
iter = 0;

while ~isequal(nowPoint, endPoint) && iter < 50

    if pr < 99
        candidate = op_rotate(lastPoint, nowPoint, SampleNumber, 4);

        candidateSize = size(candidate, 1);
        candidate = A0_filterCandidate(candidate, shapes, nowPoint); % 筛除被障碍物挡住或在障碍物中的点
        scatter3(candidate(:, 1), candidate(:, 2), candidate(:, 3), 'b', '.');

        if size(candidate, 1) < candidateSize / 2 %如果路径点筛除过多，则使用轴向搜索算子搜索路径点并筛选
            candidate = op_axes(nowPoint, 400, A0_getDist(nowPoint, endPoint) / 2);
            candidate = A0_filterCandidate(candidate, shapes, nowPoint);
        end

        [candidate, prob] = A0_prob(candidate, shapes, endPoint);

        if size(candidate, 1) == 0
            iter = iter + 1;
            continue;
        end

        [nextPoint, pr] = A0_findFarthestPoint(candidate, prob, endPoint); %选择转移概率最大的点作为下一个点
    else
        nextPoint = [6 16 1];
    end

    scatter3(nowPoint(1, 1), nowPoint(1, 2), nowPoint(1, 3), 'red', '*');
    scatter3(candidate(:, 1), candidate(:, 2), candidate(:, 3), 'b', '.');
    scatter3(nextPoint(1, 1), nextPoint(1, 2), nextPoint(1, 3), 'black', 'filled');
    ip = A0_interpolatePoints(nowPoint, nextPoint);
    D = D + A0_getDist(nowPoint, nextPoint);
    Q = Q + A0_calcAngle(lastPoint, nowPoint, nextPoint);
    lastPoint = nowPoint;
    nowPoint = nextPoint;
    path = [path; ip];
    iter = iter + 1;
end

tt = toc;
path = [startPoint; path];
plot3(path(:, 1), path(:, 2), path(:, 3), Color = 'r', LineWidth = 1);

scatter3(path(:, 1), path(:, 2), path(:, 3), 'red', '*');
pathnum = size(path, 1) - 2;
Q = Q / (pathnum * 180);
