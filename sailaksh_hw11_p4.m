function [f,g,H] = sailaksh_hw11_p4(x)
% sailaksh_hw11_p4 Function evaluates the objective function f, gradient g
% and Hessian matrix H of the given Rosenbrock function at the given input
% column vector x.
%       
%       Inputs -  x : Column vector x where the Rosenbrock function needs to
%                     be evaluated.
%       Outputs - f : The Rosenbrock function evaluated at given x.
%                 g : Gradient of the objective function(first derivative of the 
%                     function with respect to x1 and x2) evaluated at given
%                     input x.
%                 H : Hessian matrix (second derivatives of f with respect
%                     to x1 and x2) evaluated at given input x.

       f = (1-x(1))^2 + 100*(x(2)-x(1)^2)^2;        % The objective function evaluated at given input x.
       
       df1dx1 = -2+2*x(1)-400*x(1)*x(2)+400*x(1)^3; % The partial derivative of f with respect to x1.
       
       df1dx2 = 200*x(2)-200*x(1)^2;                % The partial derivative of f with respect to x2.
       
       g = [df1dx1;df1dx2];                         % gradient vector is a column vector with the partial derivatives.
       
       df2dx1 = 2-400*x(2)+1200*x(1)^2;             % The second derivative of f with respect to x1.
       
       df2dx1x2 = -400*x(1);                        % The second derivative of f with respect to x1 and x2.
       
       df2dx2x1 = -400*x(1);                        % The second derivative of f with respect to x1 and x2.
       
       df2dx2 = 200;                                % The second derivative of f with respect to x2.
       
       H = [[df2dx1 df2dx1x2];[df2dx2x1 df2dx2]];   % Hessian matrix is a matrix with all the second derivatives of f.
       
end

