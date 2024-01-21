function State = initialization(SE, Dim, Range)
    Pop_Lb = Range(1, :);
    Pop_Ub = Range(2, :);
    State = rand(SE, Dim) .* repmat(Pop_Ub - Pop_Lb, SE, 1) + repmat(Pop_Lb, SE, 1);
