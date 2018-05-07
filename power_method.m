function [r, x] = inverse_power(A, x, mu, N)
% INVERSE_POWER
% A   : n x n matrix
% x   : n x 1 nonzero vector
% mu  : eigenvalue shift
% N   : number of iterations
% r   : estimated spectral radius of inv(A - mu*I)
B = A - mu * eye(size(A));
for i = 1 : N
	x = B \ x;
	x = x / norm(x, inf);
end
r = norm(A * x, inf);
end


