% Plot 2D Circle
% ---------------------------------------
% Plot a Circle in 2D plot
%
% Inputs:
%   p  :	Circle Center Point (vector) [2x1] [x; y] 
%   d  :	Circle Diameter
%
% -----------------
%   Jan T. Olsen
%   08.10.2020
% -----------------

function plot2d_circle(p, d)

    % Pre-allocate
    theta = 0:0.01:2*pi;
    
    X = p(1) + d/2*cos(theta);
    Y = p(2) + d/2*sin(theta);
    
    plot(X, Y, 'k', 'LineWidth', 1)
end