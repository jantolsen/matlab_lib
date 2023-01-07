% Plot 3D Line
% ---------------------------------------
% Plot a Line between Point 1 (p1)
% and Point 2 (p2) in 3D plot
%
% Inputs:
%   p1  :   Line Point 1 (vector) [3x1] [x1; y1; z1] 
%   p2  :   Line Point 2 (vector) [3x1] [x2; y2; z2]
%
% Outputs:
%   hg  :    Plot Group-Object
% 
% -----------------
%   Jan T. Olsen
%   08.10.2020
% -----------------

function hg = plot3d_line(p1, p2)
    
    % Group object
    hg = hggroup;
    
    % Pre-allocate
    line = zeros(2,3);

    line(1,:) = p1;
    line(2,:) = p2;

    X = line(:,1);
    Y = line(:,2);
    Z = line(:,3);

    plot3(X, Y, Z, 'k', 'LineWidth', 1, 'Parent', hg);
end