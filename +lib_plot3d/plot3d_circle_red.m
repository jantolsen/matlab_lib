% Plot 3D Circle - Red
% ---------------------------------------
% Plot a Red Circle in 3D plot
%
% Inputs:
%   p  :	Circle Center Point (vector) [3x1] [x; y; z]
%   d  :	Circle Diameter
%
% Outputs:
%   hg  :    Plot Group-Object
%
% -----------------
%   Jan T. Olsen
%   08.10.2020
% -----------------

function hg = plot3d_circle_red(p, d)
    
    % Group object
    hg = hggroup;
    
    % Pre-allocate
    theta = 0:0.01:2*pi;
    
    X = p(1) + d/2*cos(theta);
    Y = p(2) + d/2*sin(theta);
	Z = p(3) + ones(size(theta));
    
    plot3(X, Y, Z, 'r', 'LineWidth', 2, 'Parent', hg);
end