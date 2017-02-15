function T = estimatePlanePose(xImCart,XCart,K)

%Convert Cartesian image points xImCart to homogeneous representation
%xImHom
	%xImHom=...
%TO DO Convert image co-ordinates xImHom to normalized camera coordinates
%xCamHom
for i=1:length(xImHom)
    %xCamHom(:,i)=...
end
%Estimate homography H mapping homogeneous (x,y)
%coordinates of positions in real world to xCamHom. 
HEst = calcBestHomography(XCart(1:2,:),xImHom(1:2,:));
H=inv(K)*HEst;

%Estimate first two columns of rotation matrix R from the first two
%columns of H using the SVD
	%[U,L,V]=....
	%R=...
%Estimate the third column of the rotation matrix by taking the cross
%product of the first two columns
R=[R ...];
%Check that the determinant of the rotation matrix is positive - if
%not then multiply last column by -1.
	%if ...
    		%R(:,3)= ...
	%end
%Estimate the translation t by finding the appropriate scaling factor k
%and applying it to the third colulmn of H
lambda=0;
for m=1:3
    for n=1:2
        %lambda=lambda + ...
    end
end
lambda=lambda/6;
t=H(:,3)/lambda;
%Check whether t_z is negative - if it is then multiply t by -1 and
%the first two columns of R by -1.
if t(3)<0
    %t=...
    %R(:,1:2)=...
end
%assemble transformation into matrix form
T  = [R t;0 0 0 1];


end

