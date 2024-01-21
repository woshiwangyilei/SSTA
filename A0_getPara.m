function [alpha, beta, delta] = A0_getPara(nowPoint, endPoint)

    % 计算两点之间距离
    alldist = A0_getDist(nowPoint, endPoint);

    % 计算相关比例距离
    alpha = alldist / 3;
    beta = alldist / 2;
    delta = alldist / 2;

end
