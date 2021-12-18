function question3

t = [0.0 1.0 2.0]';
u = [exp(0.1) exp(0.9) exp(2)]';
b = log(u);

% we defined b_i as ln(u_i)

A = [ones(size(t)) t];
bfit = A * ((A' * A)\(A' * b));   % we solve the matrix equation the same way to find a vector for x

plot(t,b,'*',t,bfit); % we plot just to see that indeed this is a straight line of best fit

% the curve of u(t) is therefore the answer we get for bfit raised to e

ut = exp(bfit);

plot(t,u); 
hold on
plot(t,ut);
hold off


end