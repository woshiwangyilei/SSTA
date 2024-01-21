clc
clear
T = table({'规划时间', '路径长度', '曲率',  '迭代次数'});
y = 0;
bestD=100;
bestQ=100;
bestt=100;
for i = 1:500
    [tt, D, pathnum, Q, iter,path] = A0_SSTA([2 18.5 1], [9 18.5 4]);%  [2 18.5 1]  [2 2 0]  [18.5 2 2]

    if iter == 50
        %         y=y+1;
        continue
    end
    if D<bestD
    bestD=D;
    bestQ=Q;
    bestt=tt;
    bestpath=path;
    end
    T = [T; table({tt, D, Q,iter})]; 
end

writetable(T, 'SSTA1.xlsx', 'Sheet', 1, 'Range', 'A1');

%%
shapes = A0_env3D([18.5 2 2], [9 18.5 4]);
for i=1:size(edges,1)-1
plot3([edges(i,1),edges(i,4)],[edges(i,2) edges(i,5)],[edges(i,3) edges(i,6)],Color = 'black', LineWidth = 1)
end

plot3(edges1(:, 1), edges1(:, 2), edges1(:, 3), Color = 'r', LineWidth = 1);