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



function [mu] = rqi(A, x, mu, N)
% RQI
% A   : n x n matrix
% x   : n x 1 nonzero vector
% N   : number of iterations
% mu  : estimated spectral radius of A
I = eye(size(A));
for i = 1 : N
  x = (A - mu * I) \ x;
  x = x / norm(x);
  mu = x' * A * x;
end
end

A = hilb(100);
eig_all = eig(A);
eig_target = eig_all(end-2);

x = ones(100, 1);
mu = 0.5;
for N = 1 : 5
	eig_inv = inverse_power(A, x, mu, N);
	eig_rqi = rqi(A, x, mu, N);
	err_inv = abs(eig_inv - eig_target);
	err_rqi = abs(eig_rqi - eig_target);
	fprintf('| %d | %e | %e |\n', N, err_inv, err_rqi);
end
