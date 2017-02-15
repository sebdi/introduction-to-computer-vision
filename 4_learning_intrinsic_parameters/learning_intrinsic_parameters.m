function learning_intrinsic_parameters
addpath('../1_pinhole');
% We assume that the intrinsic camera matrix K is known and has values
Lambda = [640 0 320; 0 640 240; 0 0 1];

% We assume that the extrinsic matrix T is known and has values
Omega = rotx(60);
tau = [0 -100 0]';

% Generate points of an rigid object
n= 130;
w_obj(1:2,:) = randn(2,n)*100; % [u_i,v_i,w_i]
w_obj(3,:) = rand(1,n)*100; % [u_i,v_i,w_i]

X = calcImagePosition(w_obj, Lambda, Omega, tau);

Lambda_est = estimateIntrinsicParameters(w_obj, X, Omega, tau);

norm(Lambda-Lambda_est) % should be small if your code is correct

%==========================================================================
function X = calcImagePosition(w_obj, Lambda, Omega, tau)

% calculates the image position for each camera view j and stores the
% result in cell array X

X=[];
for i=1:length(w_obj)
% TODO: use your pinhole function
X = [X;x;y];
end

%==========================================================================
function Lambda_est = estimateIntrinsicParameters(w_obj, X, Omega, tau)

% write the routine to estimate the world points from j views

A = [];
for i=1:length(w_obj)
%TODO generate A matrix
end
x = %TODO solve equation system to get estimates for lambda
Lambda_est = [x(1) x(2) x(3);0 x(4) x(5);0 0 1];
