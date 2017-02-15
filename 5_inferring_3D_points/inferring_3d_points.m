function inferring_3d_points
addpath('../1_pinhole');
% We assume that the intrinsic camera matrix is known and has the values
Lambda = [640 0 320; 0 640 240; 0 0 1];

% We generate points of an rigid object
n= 130;
w_obj(1:2,:) = randn(2,n)*100; % [u_i,v_i,w_i]
w_obj(3,:) = rand(1,n)*100; % [u_i,v_i,w_i]

% We assume that the extrinsic matrix T is known for 3 views
Omega{1} = rotx(60);
tau{1} = [0 -100 0]';
Omega{2} = rotx(30);
tau{2} = [-100 0 0]';
Omega{3} = rotx(90);
tau{3} = [0 0 -100]';

X = calcImagePosition(w_obj, Lambda, Omega, tau);

w_obj_est = solveReconstruction(w_obj, X, Lambda, Omega, tau);

% your code is correct if the result is a small number
norm(w_obj_est - w_obj) 

%==========================================================================
function X = calcImagePosition(w_obj, Lambda, Omega, tau)

% calculates the image position for each camera view j and stores the
% result in cell array X

for j=1:length(Omega)
    X{j} = [];
    for i=1:length(w_obj)
        %****TO DO **** user you pinhole function
        X{j} = [X{j} ;x y];
    end
end


%==========================================================================
function w_obj_est = solveReconstruction(w_obj, X, Lambda, Omega, tau)

% write the routine to estimate the world points from j views

for i=1:length(w_obj)
A = [];
b = [];
for j=1:length(Omega) % iterate over the j views
        xy = % TODO transform the image points into homogenous coordinates
        A = %****TO DO **** set A matrix
        b = %****TO DO **** set b vector
end
w_obj_est(:,i) = %****TO DO **** solve equation system
end   
