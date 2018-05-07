A = gallery('tridiag', 1000, -1, 4, -1);
b = ones(1000, 1);
x = zeros(1000, 1);

fprintf(1, 'Precondition Conjugate gradient:\n');
fprintf(1, '#iter\t error\n');

E = gallery('tridiag', 1000, -1, 2, -1);
M = E * E
r = A * x - b;
z = r \ M
d = -z;
for i = 1 : 50
	alpha = - r' * d / (d' * A * d));
	x = x + alpha * d;
	y = E * x
	r = A * x - b;
	z = r / M
	beta = (- z' * A * d) / (d' * A * d));
	d = - r - beta * d;
	%if i == 25 || i == 50
	fprintf('%d\t\t%.3e\n', [i, sum(abs(A' * (A * y) - A' * b))]);
	%end
end
