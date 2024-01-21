function [tt, D, pathnum, Q, iter,path] = A0_SSTA(startPoint, endPoint)
    shapes = A0_env3D(startPoint, endPoint);
    tic;
    nowPoint = startPoint;
    path = nowPoint;
    SampleNumber = 50;
    D = 0;
    Q = 0;
    pr = 0;
    iter = 1;
    choo = 1;

    while ~isequal(nowPoint, endPoint) && iter < 50

        if pr < 99

            switch choo
                case 1
                    candidate = op_expand_o([10 10 2.5], SampleNumber, 0.5); %op_expand_o(nowPoint, SampleNumber, 1); % op_expand_o([10 10 2.5], SampleNumber, 0.5);
                case 2
                    candidate = op_axes(nowPoint, SampleNumber, 1);
                case 3
                    candidate = op_rotate(endPoint, nowPoint, SampleNumber, A0_getDist(nowPoint,endPoint)/3); %op_rotate_o(nowPoint, SampleNumber, 5); %op_rotate(endPoint, nowPoint, SampleNumber, A0_getDist(nowPoint,endPoint));
                case 4
                    candidate = op_translate(lastPoint, nowPoint, SampleNumber, 1);
            end


            
            candidate = A0_filterCandidate(candidate, shapes, nowPoint);

            

            if size(candidate, 1) == 0
                continue
            end
% scatter3(candidate(:, 1), candidate(:, 2), candidate(:, 3), 'black', '.');
            [candidate, prob] = A0_prob(candidate, shapes, endPoint);
            [nextPoint, pr] = A0_findFarthestPoint(candidate, prob, endPoint);

%             scatter3(nowPoint(1, 1), nowPoint(1, 2), nowPoint(1, 3), 'red', '*');
%             scatter3(candidate(:, 1), candidate(:, 2), candidate(:, 3), 'black', '.');
%             scatter3(nextPoint(1, 1), nextPoint(1, 2), nextPoint(1, 3), 'black', 'filled');
            lastPoint = nowPoint;
            nowPoint = nextPoint;
        else
            nextPoint = endPoint;
            nowPoint = nextPoint;
        end

        path = [path; nextPoint];

%                 if choo == 2
%                     choo = 1;
%                 else
%                     choo = choo + 1;
%                 end

        iter = iter + 1;
    end

    tt = toc;
%     plot3(path(:, 1), path(:, 2), path(:, 3), Color = 'r', LineWidth = 1);
%     scatter3(path(:, 1), path(:, 2), path(:, 3), 'red', '*');
    pathnum = size(path, 1);

    for i = 1:pathnum - 1 % 遍历每一行
        D = D + A0_getDist(path(i, :), path(i + 1, :)); % 计算D并累加

        if i > 1
            Q = Q + A0_calcAngle(path(i - 1, :), path(i, :), path(i + 1, :)); % 计算Q并累加
        end

    end

    Q = Q / (pathnum * 180);
end
