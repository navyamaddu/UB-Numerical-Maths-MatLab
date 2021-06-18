function [x,f] = sailaksh_hw11_p3(fun,x0,tol,maxIter)
% sailaksh_hw11_p3 Function uses the damped Newton method for minimization to 
% determine the minimum and its location of a generic function using a function handle
% (which returns the objective function value, gradient of the objective function 
% and Hessian of the objective function.
%   Inputs - fun   :  Function handle to the function to be minimized.
%                     Inputs to the function handle - initial guess vector x0.
%                     Outputs to the function handle - f-The objetive function
%                     evaluated at x, g-gradient of the objective function
%                     evaluated at x and H-Hessian of the objective function
%                     evaluated at x.
%            x0     : Initial guess of the minimum location.
%            tol    : Tolerance for convergence.
%            maxIter: The maximum number of iterations to run.
%
%   Outputs - x : The location of the minimum.
%             f : the function value at the minimum.


        alpha = 0.75;               % Constant damping coefficient alpha = 0.75.
        
        if isrow(x0)                % If the input initial guess vector x0 is a row vector
            
            x0 = x0';               % If it is a row vector, apply transpose to convert it into a column vector.
            
        end
        
        [f0,g0,H0] = fun(x0);       % Initially, the function handle is evaluated at x0 and returns the objection function f0, gradient g0 and Hessian H0 evaluated at initial guess vector x0.
        
        count = 0;                  % Initialize the count(number of iterations) to zero.
        
        flag = 0;                   % set the flag to zero to check whether the program enters the while loop.
        
        while norm(g0)>tol          % Iterate until the 2-norm of the gradient g0 is less than tolerance.
            
            flag = 1;               % falg is set to 1 if the norm of gradient is greater than the given tolerance.
            
            %{ 
                Using the damped Newton method, the approximation of the
                minimum value is calculated using the initial guess vector
                x0, the gradient at x0 and hessian evaluated at x0 using
                the condition x0 - inv(H0) * g0 * alpha.
            %}
            
            x1 = x0 - inv(H0) * g0 * alpha;
            
            [f1,g1,H1] = fun(x1);  % Now, the function handle is evaluated at the new approximation x1 and returns f1, g1 and H1 evaluated at x1.
            
            g0 = g1;               % The initial gradient value is updated with new gradient g1.
            
            H0 = H1;               % The initial Hessian matrix is updated with new Hessian H1.
            
            x0 = x1;               % The initial guess vector x0 is updated with new approximated minimum x1.
            
            count = count+1;       % At each run, the number of iterations are incremented by 1.
            
            if count >= maxIter    % Return an error if the number of iterations is greater than the input maxIter.
                
                error("Convergence is not achieved until maxIter");
                
            end
            
        end
        
        if flag                    % Check if the falg is 1(i.e., the input guess is different from the true minimum)
            
            x = x1;                % The final mimimum value after the convergence is reached is stored in x.
            
            f = f1;                % The final function value evaluated at the minimum x1 is stored in f.
        
        else                       % If the flag is zero(i.e., the program didn't enter the while loop indicating that the initial guess vector is equal to true minimum)
            
            x = x0;                % The initial guess vector is returned as the location of the minimum.
            
            f = f0;                % The function value evaluated at initial guess vector x0 is returned in f.
        
        end
end

