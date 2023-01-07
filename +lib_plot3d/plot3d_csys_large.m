% Plot 3D Coordinate System
% ---------------------------------------
% Plot the coordinate system in 3D plot
% with default rgb-colors to the related axis.
% 
% Inputs:
%   H       :   Transformation-matrix (matrix) [4x4]
%
% Outputs:
%   hg  :    Plot Group-Object
%     
% -----------------
%   Jan T. Olsen
%   08.10.2020
% -----------------

function hg = plot3d_csys_large(H)
    
    % Group object
    hg = hggroup;
    
    % Pre-allocate
    axis = zeros(2,3);

    % Rotation and Translation
    d = H(1:3,4);   % Translation vector
    R = H(1:3,1:3); % Rotation matrix

    % Axis colors
    colors = {'r', 'g', 'b'};

    % Length of each axis in csys
    csys_len = 750;

    % Plot all 3 axis
    % (Looping through plotting one axis at a time)
    for i = 1:3
        axis(1,:) = d;                      % csys origo [x0 y0 z0]
        axis(2,:) = d + R(:,i)*csys_len;    % end point of axis [x y z]

        X = axis(:,1);  % Vector of the x-component
        Y = axis(:,2);  % Vector of the y-component
        Z = axis(:,3);  % Vector of the z-component

        % Plot one of the axis with the related color
        plot3(X, Y, Z, colors{i}, 'LineWidth', 1, 'Parent', hg);
    end
end