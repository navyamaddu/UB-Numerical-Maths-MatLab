function [f,J] = sailaksh_hw11_p2(x)
% sailaksh_hw11_p2 Function returns the residual vector f and Jacobian
% matrix J for a given system of non linear equations.
%   
%   Inputs  - x - a column vector where the residual and Jacobian needs to
%             be computed.
%
%   Outputs - f - Residual vector (column vector) computed at given x.
%             J - Jacobian matrix (the partial derivatives of given system
%             of non linear equations evaluated at given input x).
       
        f = zeros(2,1);                 % the residual vector f is initialized such that it is a column vector.
        
        f(1) = 4 * x(1)^2 + x(2)^2 - 1; % The first non linear equation evaluated at input x.
        
        f(2) = x(1)^4+ cos(pi*x(2));    % the second equation evaluated at given x.
        
        f = [f(1);f(2)];                % The residual vector f such that it is column vector.
        
        df(11) = 8*x(1);                % The partial derivative of first equation with respect to x1.
        
        df(12) = 2*x(2);                % The partial derivative of first equation with respect to x2.
        
        df(21) = 4*x(1)^3;              % The partial derivative of second equation with respect to x1.
        
        df(22) = -pi*sin(pi*x(2));      % The partial derivative of second equation with respect to x2.
        
        J = [[df(11) df(12)];[df(21) df(22)]]; % Jacobian matrix with all the partial derivatives evaluated at given x.
        
end



