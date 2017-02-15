function H = calcBestHomography(pts1Cart, pts2Cart)

%should apply direct linear transform (DLT) algorithm to calculate best
%homography that maps the points in pts1Cart to their corresonding matchin in
%pts2Cart

%first turn points to homogeneous
pts1CartHom = [pts1Cart(1:2,:); ones(1,size(pts1Cart,2))];
pts2CartHom = [pts2Cart(1:2,:); ones(1,size(pts2Cart,2))];
%then construct A matrix which should be (10 x 9) in size
A=[];
for i=1:length(pts2CartHom)
    %A=...
end
%solve Ah = 0 by calling
h = solveAXEqualsZero(A);

%reshape h into the matrix H
%H = ...
%Beware - when you reshape the (9x1) vector x to the (3x3) shape of a homography, you must make
%sure that it is reshaped with the values going first into the rows.  This
%is not the way that the matlab command reshape works - it goes columns
%first.  In order to resolve this, you can reshape and then take the
%transpose
end

