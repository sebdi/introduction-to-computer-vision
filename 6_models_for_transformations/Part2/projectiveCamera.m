%goal of function is to project points in XCart through projective camera
%defined by intrinsic matrix K and extrinsic matrix T.
function xImCart = projectiveCamera(K,T,XCart);


xImCart = [];
for i=1:length(XCart)
    %convert Cartesian 3d points XCart to homogeneous coordinates XHom
    	%XHom=...
    %apply extrinsic matrix to XHom to move to frame of reference of
    %camera
    	%x=...
    %project points into normalized camera coordinates xCamHom by (achieved by
    %removing fourth row)
    	%xCamHom=...
    %move points to image coordinates xImHom by applying intrinsic matrix
    	%xImHom=...
    %TO DO convert points back to Cartesian coordinates xImCart
    	%xImCart=...
end

end

