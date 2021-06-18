% EAS501_Kritik4b Script creates a log-log plot showing the
% error (i.e., abs(truth-approximation)) of each approximation (orders 1 and 2) as a 
% function of the grid size (ranging from 10^-1 to 10^-16) for f(x)=cos(x) evaluated at x=1
% using the function EAS501_Kritik4a which provides the approximated
% derivatives.

f = @cos;                                         % Function handle f with input function cos.
x = 1;                                            % Location where to compute the first derivative (a scalar input).
h = logspace(-1,-16);                             % Grid spacings ranging from 10^-1 to 10^-16 generated using logspace.
truth = -sin(x);                                  % The true derivative of cos(x) ie., -sin(x).
approximated_order1 = EAS501_Kritik4a(f,x,h,1);   % The first order approximated derivative of cos(x) at x=1 for the given h is calculated using EAS501_Kritik4a.
order1_error = abs(truth-approximated_order1);    % The absolute error for order 1 is calculated by subtracting the approximation from the truth.
disp(order1_error);
approximated_order2 = EAS501_Kritik4a(f,x,h,2);   % The second order approximated derivative of cos(x) at x=1 for the given h is calculated using EAS501_Kritik4a.
order2_error = abs(truth-approximated_order2);    % The absolute error for order 2 is calculated by subtracting the approximation from the truth.
loglog(h,order1_error,h,order2_error);            % loglog() is used to plot the errors vs grid spacings for orders 1 and 2.
legend('Order 1','Order 2');                      % legend() is used to differentiate the orders 1 and 2.
xlabel('Grid spacings (h)');                      % xlabel() to label the x-axis.
ylabel('Absolute error (abs(truth-approximation)');% ylabel() to label the y-axis.
title('Trade-off between the truncation error in derivative approximations '); 