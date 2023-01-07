% Plot 2D Coordinate System
% ---------------------------------------
% Plot the coordinate system in 2D plot
% with default rgb-colors to the related axis.
%
% Inputs:
%   H       :   Transformation-matrix (matrix) [3x3]
%
% -----------------
%   Jan T. Olsen
%   08.10.2020
% -----------------

function plot2d_csys_small(H)
    
    % Pre-allocate
    axis = zeros(2,2);

    % Rotation and Translation
    d = H(1:2,3);   % Translation vector
    R = H(1:2,1:2); % Rotation matrix

    % Axis colors
    colors = {'r', 'g'};

    % Length of each axis in csys
    csys_len = 250;

    % Plot 2 axis
    % (Looping through plotting one axis at a time)
    for i = 1:2
        axis(1,:) = d;                      % csys origo [x0 y0]
        axis(2,:) = d + R(:,i)*csys_len;    % end point of axis [x y]

        X = axis(:,1);  % Vector of the x-component
        Y = axis(:,2);  % Vector of the y-component

        % Plot one of the axis with the related color
        plot(X, Y, colors{i}, 'LineWidth', 1)
    end
end