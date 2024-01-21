function shapes = A0_env3D(stratPoint, endPoint)
%     figure;
%     hold on;
%     %% 视图设置
%     xlabel('X');
%     ylabel('Y');
%     zlabel('Z');
% %     title('环境 1');
%     grid on;
%     view(135, 45);
%     xlim([0 20])
%     ylim([0 20])
%     zlim([0 5])
%     set(gca, 'FontSize', 20);
    %% 画立方体
    A0_drawCuboid([1 4 5], [9.5 8 2.5], 0, [0.5 0.5 0.5], 0.5); %括号内先长度再坐标，[]分别是xyz
    A0_drawCuboid([6 1 4], [17 9.5 3], 0, [0.5 0.5 0.5], 0.5);
    A0_drawCuboid([6 1 5], [10 14.5 2.5], 0, [0.5 0.5 0.5], 0.5); %[9 1 5], [9.5 12.5 2.5]     [7.9 1 5], [10.05 12.5 2.5]
    A0_drawCuboid([1 6 5], [6.5 17 2.5], 0, [0.5 0.5 0.5], 0.5);
    A0_drawCuboid([1 4 3.5], [4.5 7 1.75], 80, [0.5 0.5 0.5], 0.5); %[1 4 5], [4.5 7 2.5]     [1 4 4], [4.5 7 2],
    A0_drawCuboid([1 4 4], [12 3 2.5], 45, [0.5 0.5 0.5], 0.5);

    shape2 = A0_drawCuboid([1.5 4.5 5], [9.5 8 2.5], 0, [0 0 0], 0);
    shape3 = A0_drawCuboid([6.5 1.5 4], [17 9.5 3], 0, [0 0 0], 0);
    shape4 = A0_drawCuboid([6.5 1.4 5], [10 14.5 2.5], 0, [0 0 0], 0); %[9.5 1.4 5], [9.5 12.5 2.5]     [8.4 1.5 5], [10.05 12.5 2.5]
    shape5 = A0_drawCuboid([1.5 6.5 5], [6.5 17 2.5], 0, [0 0 0], 0);
    shape6 = A0_drawCuboid([2 4.5 4], [4.5 7 1.75], 80, [0 0 0], 0); %[2 4.5 4], [4.5 7 2]      [2 4.5 5], [4.5 7 2.5]
    shape7 = A0_drawCuboid([1.5 4.5 4.5], [12 3 2.5], 45, [0 0 0], 0);

    shape1 = A0_drawCuboid([20 20 5], [10 10 2.5], 0);
    % 画球体
    A0_drawSpheres([2.0, 5.0, 2.5, 1], 0.5);
    shape8 = A0_drawSpheres([2.0, 5.0, 2.5, 2], 0);
    shape9 = A0_drawSpheres([18.0, 14.0, 2.5, 2], 0.5);

    shapes = {shape1, shape2, shape3, shape4, shape5, shape6, shape7, shape8, shape9};
    %     起点和终点
%     scatter3(stratPoint(1), stratPoint(2), stratPoint(3), 'red', 'filled');
%     scatter3(endPoint(1), endPoint(2), endPoint(3), 'red', 'filled');

    %     hold off;
end
