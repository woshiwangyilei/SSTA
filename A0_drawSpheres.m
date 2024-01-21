function shape = A0_drawSpheres(spheres, FaceAlpha)

    [x, y, z] = sphere(); % Create a unit sphere
    x = x * spheres(4) + spheres(1); % Scale and translate x-coordinates
    y = y * spheres(4) + spheres(2); % Scale and translate y-coordinates
    z = z * spheres(4) + spheres(3); % Scale and translate z-coordinates
    x = x(:);
    y = y(:);
    z = z(:);
    shape = alphaShape(x, y, z, spheres(4));
%     plot(shape, 'EdgeColor', [0.5 0.5 0.5], 'EdgeAlpha', FaceAlpha, 'FaceColor', [0.5 0.5 0.5], 'FaceAlpha', FaceAlpha);

end
