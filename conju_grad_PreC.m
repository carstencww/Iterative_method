A = gallery('tridiag', 1000, -1, 4, -1);
b = ones(1000, 1);
x = zeros(1000, 1);

fprintf(1, 'Precondition Conjugate gradient:\n');
fprintf(1, '#iter\t error\n');

E = gallery('tridiag', 1000, -1, 2, -1);
M = E * E;
r = b - A * x;
z = M \ r;
p = z;
for i = 1 : 50
	alpha = (- z' * r) / (d' * A * d);
	x = x + alpha * d;
	temp = z' * r;
	r = r - alpha * A * p; 
	y = E * x;
	z = M \ r;
	beta = (z' * r) / temp;
	d = z + beta * d;
	%if i == 25 || i == 50
	fprintf('%d\t\t%.3e\n', [i, r' * r]);
	%end
end
