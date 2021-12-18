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


function [p, iterations] = fixedpointQ3(x0, atol)

format longg

solution = fzero( @f, 0.5);                                 % we create a reference solution first, using the longg format

x = nan(1,100);                                             % is vecotorized to be nans
x(1) = x0;                                                  % the first entry in x is our input to simplify


for i = 1:100               
    x(i+1) = g(x(i));                                       % this is the classic fixed point iteration
    if abs(x(i+1)-x(i)) <= atol                          % we check for break condition
        p = x(i+1);                                         % if so we ouput x(i+1) as p
        iterations = i;                                     % return i as iterations
        return;
    end
    x(i+1)                                                  % we output x at each step
    i                                                       % and the iteration number
    progress = abs(x(i+1) - solution)                       % progress is calculated as the difference from reference

end

if i == 100;
    disp ('Computation has timed out, fixed point iteration may diverge');     % this is our timeout messsage in case we get out of the while loop without triggering the return condition

end

end

function g = g(x)                                           % a separate function for g as in the canonical fixed point iteration scheme

    g = (x^2)/4;
end

function f = f(x)                                           % a separate function for f for the fzero to work with

    f = log(x) + x;
end



