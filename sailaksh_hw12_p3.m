function [val] = sailaksh_hw12_p3(f,a,b,n)
% sailaksh_hw12_p3 Function numerically evaluates the integral of f over
% the limits a to b using Simpson's rule where n represents the number of
% intervals to use. Here, value of integral is calculated using Composite
% rule.
%   Inputs   f - function handle which returns the function value evaluated at x and can
%                accept vector-valued inputs.
%            a - Lower limit of the integral.
%            b - Upper limit of the integral.
%            n - number of intervals to use.
%   Output val - Approximated integral value using Composite Simpson's rule.
%   
    h = (b-a)/n;            % h represents the grid spacing of each interval obtained by b-a/n.
    
    new_b = 0;              % Initialize the value of new_b to zero.
    
    val = 0;                % The approximated integral value is initialized to zero.
    
    while new_b < b         % Iterate the loop until the updated b value is greater than the upper limit b.
        
        x1 = a;             % set the value of x1 to lower limit a.
        
        new_b = x1 + h;     % the new upper limit b is calculated based on the length of the grid spacing h.
       
        x2 = (new_b+x1)/2;  % The midpoint of the new intervals is calculated and stored in x2.
        
        x3 = new_b;         % the new upper limit b is assigned to x3.
        
        %{
        
            Using simpson's rule, the given function is approximated as a
            quadratic function using the formula ((b-a)/6) * (f(x1)+ 4 * f(x2) + f(x3))).
        
            Using composite rule, the approximation at each interval h (based on the given intervals n)
            is summed together to give the final approximation of the given function.
       
        %}
       
        val = val + (((new_b - a)/6) * (f(x1)+ 4 * f(x2) + f(x3)));
        
        a = new_b;          % The lower limit a is updated at each iteration (based on the upper limit of the previous itertion).
    
    end
%     disp(new_b)
%     disp(x3)
end

