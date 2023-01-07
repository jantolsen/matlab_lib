% Plot 3D Cylinder
% ---------------------------------------
% Plot the Pose a Cylinder in 3D plot
% Relative to the Cylinder's local coordinate-system (LCSYS) 
% located at the bottom of the cylinder.
%
% Additional Coordinate-System are also displayed:
% This includes the Center-of-Gravity coordinate system
% and the Top-Surface coordinate system
%
% Input:
%   pos	: Position of the Cylinder (vector) [3x1]
%	phi	: Orientation of the Cylinder (vector) [3x1]
%   r   : Radius of the Cylinder
%   h   : Height of the Cylinder
%   c   : Color of Cylinder (e.x. 'red', 'blue', etc)
%      
% Outputs:
%   hg  :    Plot Group-Object
% 
% -----------------
%   Jan T. Olsen
%   12.01.2022
% -----------------

function hg = plot3d_cylinder(pos, phi, r, h, c)
    
    %% Constants
        deg2rad = pi/180;
        rad2deg = 180/pi;
    
    %% Cylinder Calculation
        
        % Initialization
        Rc = lib_math3d.Rzyx(phi);	% Rotation Matrix
        Pc = pos;                	% Position
                
        % Cylinder Transformation Matrix
        % Local CSYS (Bottom-Surface)
        Hc_csys = eye(4);           	% Initialize Transformation Matrix
        Hc_csys(1:3, 1:3) = Rc;         % Rotation          
        Hc_csys(1:3, 4) = Pc;           % Position
        
        % Additional csys
        A_top = lib_math3d.DH(0, h, 0, 0);      % Top-Surface
        A_cog = lib_math3d.DH(0, h/2, 0, 0);	% Center-of-Gravity

        HC_top = Hc_csys * A_top;
        HC_cog = Hc_csys * A_cog;

        % Cylinder Object
        n = 10;                     % Number of points around circumference
        [X,Y,Z] = cylinder(r, n);   % Create a cylinder object     

        % Update Position
        X = X + Pc(1);              
        Y = Y + Pc(2);
        Z = Z*h + Pc(3);
        
    %% Plot Cylinder Pose
        
        % Group objects
        hg = [];
 
        % Plot Coordinate Systems
        % -------------------------
        hg(1) = lib_plot3d.plot3d_csys_small(Hc_csys);	% Local CSYS
        hg(2) = lib_plot3d.plot3d_csys_small(HC_cog);	% Center-of-Gravity CSYS
        hg(3) = lib_plot3d.plot3d_csys_small(HC_top);	% Top-Surface CSYS
        
        % Plot Surface
        % -------------------------
        hg(4) = surf(X,Y,Z, 'facecolor', c, 'LineStyle', 'none');
        hg(5) = fill3(X(1,:), Y(1,:), Z(1,:), c);
        hg(6) = fill3(X(2,:), Y(2,:), Z(2,:), c);

        % Initialize Transform-object
        T = hgtransform;
        
        % Update Plot-Object(s) and parent the objects to the hgtransform object 
        set(hg(4), 'Parent', T)
        set(hg(5), 'Parent', T)
        set(hg(6), 'Parent', T)

        % Define Rotation-Matrix based on Orientation angles
        % (HG-transform required [4x4]-matrix
        Rzyx = eye(4);
        Rzyx(1:3, 1:3) = Rc;
        
        % Define Translation of the Object-Position
        % Ensures that the Rotation is rotated on the correct object-axis
        % (instead of origin-axes) 
        T1 = makehgtform('translate', -pos);
        T2 = makehgtform('translate', pos);
        
        % Perform Transformation of the Plot-Object(s)
        set(T, 'Matrix', T2*Rzyx*T1);
end

