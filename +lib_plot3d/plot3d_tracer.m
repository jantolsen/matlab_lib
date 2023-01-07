% Plot 3D - Trace
% ---------------------------------------
% Plot a Point-Tracer to show the previous
% locations of a point (typically used for Tool-Point tracing)
% number of previous points are determined by a buffered size
%
% Inputs:
%   p       :   Point (vector) [3x1] [x1; y1; z1] 
%   buffer  :   Size of buffered points
%
% Outputs:
%   hg  :    Plot Group-Object
% 
% -----------------
%   Jan T. Olsen
%   22.11.2021
% -----------------
function hg = plot3d_tracer(p, buffer)
    
    % Group object
    hg = hggroup;
    
    % Persistent variables
    persistent n;
    persistent p_x;
    persistent p_y;
    persistent p_z;
    
    % Initialization
    if isempty(n)
        n = 1;
        p_x = zeros(1,buffer);
        p_y = zeros(1,buffer);
        p_z = zeros(1,buffer);
    end
    
    % Plot Point-Tracer
    if  n <= buffer
        p_x(n) = p(1);
        p_y(n) = p(2);
        p_z(n) = p(3);
        n = n + 1;
        plot3(p_x,p_y,p_z,'.r','MarkerSize',1, 'Parent', hg);
    else
        n = 1;
    end
end

