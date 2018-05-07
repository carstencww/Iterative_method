A = gallery('tridiag', 2000, -1, 4, -1);
A = A(:, 1:1000);
b = ones(2000, 1);
x = zeros(1000, 1);
fprintf(1, 'Conjugate gradient:\n');
fprintf(1, '#iter\t error\n');

r = A' * (A * x - b);
d = -r;
for i = 1 : 50
	alpha = - r' * d / (d' * A' * (A * d));
	x = x + alpha * d;
	r = A' * (A * x - b);
	beta = (r' * A' * (A * d)) / (d' * A' * (A * d));
	d = - r + beta * d;
	%if i == 25 || i == 50
	fprintf('%d\t\t%.3e\n', [i, sum(abs(A' * (A * x) - A' * b))]);
	%end
end
