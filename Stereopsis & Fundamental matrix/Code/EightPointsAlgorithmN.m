function  [F] = EightPointsAlgorithmN(P1, P2)
% Computes F normalized for the set of points P1 and P2

%Normalize set of points
[nP1, T1] = normalise2dpts(P1);
[nP2, T2]= normalise2dpts(P2);

%Use the Eight Points algorithm as defined before
F = EightPointsAlgorithm(nP1, nP2);

% Desnormalization of final F
F=T2'*F*T1;

end

