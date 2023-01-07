% Plot 2D Line - Magneta
% ---------------------------------------
% Plot a Line between Point 1 (p1)
% and Point 2 (p2) in 2D plot
%
% Inputs:
%   p1  :   Line Point 1 (vector) [2x1] [x1; y1] 
%   p2  :   Line Point 2 (vector) [2x1] [x2; y2]
%
% -----------------
%   Jan T. Olsen
%   08.10.2020
% -----------------

function plot2d_line_magneta(p1, p2)

    % Pre-allocate
    line = zeros(2,3);

    line(1,:) = p1;
    line(2,:) = p2;

    X = line(:,1);
    Y = line(:,2);

    plot(X, Y, 'm', 'LineWidth', 1)
end