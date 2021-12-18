function lsfitbyconstant

t = [0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]                          % we write t as a vecotor                          
b = [0.9 1.01 1.05 0.97 0.98 0.95 0.01 -0.1 0.02 -0.1 0.0]                 % we write b as a vector
plot(t,b,'*')                                                              % we plot b against t and notice an obvious breakpoint at 0.5
hold on
% the breakpoint should be at t = 0.5

t1 = t(1:6);                                                               % we break t1 along the 0.5
t2 = t(7:11);                                                               
b1 = b(1:6);                                                               % we break b1 along the 0.5
b2 = b(7:11);

% we are already told that this is linear least squares fit by a
% constant,indeed this is the same as the mean of the values

y1 = mean(b1)*ones(1,6);                                                   % the best fit line is the one that is the mean
y2 = mean(b2)*ones(1,5);
plot(t1,y1)
plot(t2,y2)
xlabel('t')
ylabel('b')

hold off


end