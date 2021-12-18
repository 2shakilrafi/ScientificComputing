% newtonmethodQ3.m function.
%
% ===Inputs:
% x0 -- starting value
% atol -- absolute tolerance
%
% ===Outputs:
%
% p -- approximate solution
% nf -- number of iterations
%
% ===Variables used are:
%
% x -- a vector of nans slowly populate by approximations of x
% solution --  a reference solution

function [p, iterations] = newtonmethodQ3(x0, atol)

format longg

solution = fzero( @f, 0.5);  % we create a solution first, using the longg format

x = nan(1,100);                                             % is vecotorized to be nans
x(1) = x0;                                                  % the first entry in x is our input to simplify

for i = 1:100
    x(i+1) = x(i) - f(x(i))/fprime(x(i));                   % this is the newton method
    x(i+1)                                                  % we output x at each step
    i                                                       % and the iteration number
    progress = abs(x(i+1) - solution)                       % progress is calculated as the difference from reference
    if abs(x(i+1)-x(i)) < atol                              % this is our loop breaking step
        p = x(i+1);                                         % we set the next p to be what we got at x(i+!)
        iterations = i;                                     % the iterations is the current value of i
        return;
    end

end

iterations = i;
disp ('Computation has timed out');                         % this is our timeout messsage in case we get out of the while loop without triggering the return condition

end

function f = f(x)                                           % a separate function for f

    f = log(x) + x;
end

function fprime = fprime(x)                                 % a separate function for f'
    fprime = 1/x + 1;
end
