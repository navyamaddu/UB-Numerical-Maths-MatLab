function [x] = sailaksh_hw11_p1(fdf,x0,tol)
% sailaksh_hw11_p1 Function determines the root of a system of non-linear
% functions using undamped Newton-Rhapson method using the function handle
% which returns the residual vector and jacobian matrix, intial guess vector x0
% and tolerance.
%   
%   Inputs : fdf - Function handle to a function that returns both the
%                  residual vector and Jacobian matrix.
%            x0  - Initial guess vector 
%            tol - Tolerance for convergence.
%
%   Outputs: x - Root vector of a system of non-linear functions.
       
       if isrow(x0)             % Check if the input initial guess vector is a row vector.  
           
           x0 = x0';            % If yes, convert the initial guess vector to a column vector.
       
       end
       
       [f0,J0] = fdf(x0);       % The function handle is evaluated at the initial guess vector x0 and the obtained residual and jacobian are stored at f0 and J0.
       
       count = 0;               % Initialize the variable count(number of iterations) to zero.
       
       flag = 0;                % Set the flag variable to zero. 
       
       while norm(f0) > tol     % Execute the loop until the norm of f0 is less than tolerance( convergence is obtained). 
           
           flag = 1;            % flag is set to 1 if the norm of x0 is greater than tolerance.
           
           x1 = x0-inv(J0)*f0;  % At each iteration, the approximation of the root is calculated using residual vector and the jacobian matrix.
           
           [f1,J1] = fdf(x1);   % The function handle is evaluated with the updated root x1.
           
           f0 = f1;             % The initial residual f0 is updated to new residual vector f1.
           
           J0 = J1;             % The initial jacobian matrix J0 is updated to new jacobian matrix J1.
           
           x0 = x1;             % The initial guess vector is updated with the new obtained root x1.
           
           count = count+1;     % Increment the number of iterations by 1.
           
           if count >= 100      % return an error if the number of iterations is greater than or equal to 100.
               
               error("Convergence is not achieved until 100 iterations.");
               
           end
           
       end
       
       if flag                  % Check if flag is 1
           
            x = x1;             % The final approximation (after the convergence is reached) becomes the root of the system of nonlinear equations.
       
       else                     % If flag is 0, the program didn't enter while loop, indicating that the initial guess vector x0 is exactly equal to the true root x.
           
            x = x0;             % Hence, the initial guess vector is returned as the root of the system of nonlinear equations.
       end
       
end

