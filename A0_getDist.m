function dist = A0_getDist(pos1, pos2)
    dist = sqrt(sum([(pos1(1) - pos2(1)) ^ 2, (pos1(2) - pos2(2)) ^ 2, (pos1(3) - pos2(3)) ^ 2]));
end
