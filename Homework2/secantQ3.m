% secant.m function.
%
% ===Inputs:
% f -- function to evaluate
% x0 -- initial x- value
% x1 -- x-value after that
% tol -- tolerance, set by the user
%
% ===Outputs:
%
% x -- approximate solution
% nf -- number of iterations
%
% ===Variables used are:
%
% xn -- x_n in the canonical secant method algorithm
% xnm1 -- x_(n-1) in the canonical secant method algorithm
% xnm2 -- x_(n-2) in the canonical secant method algorithm
%
% I prefer to use negative subscripts to positive subscripts.
%
% I honestly could not figure out a way to implement the secant method
% without bootstrapping and finding the initial xn i.e. x2.




function [x,nf] = secantQ3(x0, x1, atol)

format longg

solution = fzero (@f,0.5);

if x1 < x0 + atol
    disp ('x1 and x0 are same or differ by less than tolerance');
    x = '!Error';
    nf ='!Error';
else
    % Bootstrap code
    xnm2 = x0;
    xnm1 = x1;
    xn = xnm1 - (f(xnm1) * ((xnm1-xnm2)/(f(xnm1) - f(xnm2))));
    % The secant method algorithm
    nf = 1;
    % Because we have already gone through one iteration nf = 1
    
    % Main iteration
    while abs(xn - xnm1) > abs(atol) && nf < 11
        % Computation time-out counter. This is designed not to be an
        % error, the maximum iteration is set to 10 because at the speed at
        % which the secant method converges, it is unlikely to exceed that
        % limit.
        % The code is still able to return the last x along with an
        % error message
        xnm2 = xnm1;
        xnm1 = xn;
        
        xn = xnm1 - f(xnm1) * (xnm1-xnm2)/(f(xnm1) - f(xnm2));
        nf = nf + 1
        progress = abs(xn - solution)
        
    end
    x = xn;
end
if nf >= 11
    % Computation time-out message
    disp ('Computation time-out, secant method possibly diverges. *x-value may not be valid*.');
end

end

function f = f(x)                               % this is our function

    f = log(x) + x;
end

