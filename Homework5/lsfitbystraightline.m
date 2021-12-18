function lsfitbystraightline

x = [0 0.06 0.14 0.25 0.31 0.47 0.6 0.7]';    %for ease of computation we write x as a column vector
y = [0 0.08 0.14 0.2 0.23 0.25 0.28 0.29]';     % same for y

A = [ones(size(x)) x];  % we write the vandermonde matrix for a
yfit = A * ((A' * A)\(A' * y)); %the matrix yfit is therefore the solution to the equation A'Ax = A'y

plot(x,y,'*',x,yfit);   % we plot the matrix
xlabel('x');
ylabel('y');

% for part 2 of the question we do the following

[Q,R] = qr(A);

% then for the computing part we do

cd = Q' * y;

% then for solving part we do

x = R(1:2,:)\cd(1:2)

end

