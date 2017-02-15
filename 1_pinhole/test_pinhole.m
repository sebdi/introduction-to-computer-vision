function test_pinhole
% The aim of this task is to implement the pinhole camera model in pinhole.m
% This script provides an test for the implementation

% definition of the intrinsics and extrinsic of a camera
Lambda =  [320  0    320;...
    0    320  240;
    0    0    1];
Omega = rotx(10); % extrinsic rotation matrix
tau = [0 -100 0]'; % translation vector

% definition of two planes
U = [-100 100 100 -100];
Y = [200 200 0 0];
W = [200 200 200 200];
C = [0.5000 0.5000 0.5000 0.5000];
fill3(U,Y,W,C); hold on;

U = [-100 100 100 -100];
Y = [0 0 0 0];
W = [200 200 400 400];
C = [0.5000 0.5000 0.5000 0.5000];
fill3(U,Y,W,C); hold on;

% plot camera
cam = plotCamera('Location',tau,'Orientation',Omega,'Opacity',0,'AxesVisible',true,'Size',20);hold on;
grid on; axis equal; axis manual;
xlim([-250,250]); ylim([-250,250]); zlim([-150,1250]);
xlabel('u'); ylabel('v'); zlabel('w');

%%
figure(2);

tau = -inv(Omega) * tau;
Omega = Omega';
w1 = [100-linspace(1,100,100)*2;0*ones(1,100);200*ones(1,100)]; % front edge
w2 = [-100*ones(1,100);0*ones(1,100);200+linspace(1,200,100)]; % left edge
w3 = [100*ones(1,100);0*ones(1,100);200+linspace(1,200,100)]; % right edge
w4 = [100-linspace(1,100,100)*2;0*ones(1,100);400*ones(1,100)]; % edge in the back
plotImagePlane([w1 w2 w3 w4],Lambda,Omega,tau)


function plotImagePlane(w,Lambda,Omega,tau)
for i=1:length(w)
    [x,y]=pinhole(w(:,i),Lambda,Omega,tau)
    if x > 0 && x < Lambda(1,3)*2 && y > 0 && y < Lambda(2,3)*2
        plot(x,y,'O');hold on;
    end
end
set(gca,'Ydir','reverse');xlim([0,Lambda(1,3)]*2); ylim([0,Lambda(2,3)*2]);