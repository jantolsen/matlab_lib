% Trajectory Generation - 3D Cone
% ---------------------------------------
% Generate a cone trajectory.
% A circular base with an angled normal vector
%
% Inputs:
%   c       :   Circle Center Point (vector) [3x1] [x; y; z]
%   d       :   Circle Diameter
%   phi     :   Angle of normal vector (rad)
%   k       :   Number of free-axis rotations
%   n       :   Step resolution of circle
%
% Outputs:
%   T       :    Trajectory of Homogeneous Transformations (multi-dim matrix) [4x4xn] 
%     
% -----------------
%   Jan T. Olsen
%   04.01.2023
% -----------------

function T = traj3d_circular(c, d, phi, k, n)
    % Initialize 
    T(:,:,n) = zeros(4);
    H = eye(4);
    thetas = linspace(0,2*pi,n);
    betas = linspace(0,k*pi,n);
    
    % Iterate over each circle step
    for i = 1:n 
        % Current circle step
        theta = thetas(i);
        
        % Translation
        pos_x = c(1) + d/2*cos(theta);
        pos_y = c(2) + d/2*sin(theta);
        pos_z = c(3) + zeros(size(theta));
        
        P = [pos_x, pos_y, pos_z]';
        
        % Orientation
%         rot_x = 0.0;
%         rot_y = alpha;
%         rot_z = theta;
%         
%         Phi = [rot_x, rot_y, rot_z]'; 

        rot_z1 = theta;
        rot_y = phi;
        rot_z2 = betas(i);
        
        Phi = [rot_z1, rot_y, rot_z2]';         

        R = lib_math3d.Rzyz(Phi);
%         R = eul2rotm(Phi', 'ZYZ')
        
        % Transformation Matrix
        H(1:3, 4) = P;      % Translation
        H(1:3, 1:3) = R;	% Orientation 
        
        % Append current Homogeneous Transformation matrix
        T(:,:,i) = H;
    end
end

