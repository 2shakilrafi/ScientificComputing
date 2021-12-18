% Bisect.m function
% ===Inputs are:
% f -- function to be evaluated
% a -- left hand part of the root-bracketing interval
% b -- right hand part of the root-bracketing interval
% tol -- tolerance, set by user
%
% ===Outputs:
% l -- left hand of the (hopefully much smaller) root-bracketing interval
% r -- right hand of the (hopefully much smaller) root-bracketing interval
% nf -- number of function iterations
%
% ===Variables used:
% mid -- midpoint of the interval(s) according to the canonical bisection algorithm

function output = bisectQ3(a, b, atol)

format longg

l = a;
r = b;
nf = 0;


solution = fzero (@f,0.5);

if f(l) * f(r) > 0
    disp ('The interval does not bracket a root');
    l = '!Error';
    r = '!Error';
    nf ='!Error';
elseif r < l + atol
    disp ('a and b are the same or differ by less than tolerance');
    l = '!Error';
    r = '!Error';
    nf ='!Error';
    
else
    while abs(r - l) > abs(atol) && nf < 100
        % Computation time-out counter. This is designed not to be an
        % error. 100 is chosed because 2^(-100) * (a -b) should give us an
        % appropriate value.
        % The code is still able to return the last l and r along with an
        % error message.
        mid = l + (r - l) / 2;
        
        if f(l) * f(mid) < 0
            r = mid
        elseif f(r) * f(mid) < 0
            l = mid
            progress = abs((l+r)/2 - solution)
        else
            l = '!Error';
            r = '!Error';
            nf = '!Error';
            break;
        end
        nf = nf + 1;
        
    end
    
end
if nf >= 100
    disp ('Computaton time-out.');
    % Computation time-out error message
end

output = (l+r) /2;

end

function f = f(x)

    f = log(x) + x;
end
