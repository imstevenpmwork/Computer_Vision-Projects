function  [F] = EightPointsAlgorithm(P1, P2)
% Computes F normalized for the set of points P1 and P2

% Define A as in Slide 17 of the  Lecture 11
A=[P2(1,:)'.*P1', P2(2,:)'.*P1', P2(3,:)'.*P1'];

% Apply Singular Value Decomposition to matrix A
[~, ~, V]=svd(A);

% Get the last column of V as an estimation of the matrix F
f=V(:,size(V,2));

% Reshape estimation
F = reshape(f,[3,3])';

% Force rank of it to be 2 and get a new F estimation
[U, D, V] = svd(F);
D(3,3)=0;

% Final F
F=U*D*V';

end

