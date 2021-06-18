function [f] = sailaksh_hw1_p3(n)
%sailaksh_hw1_p3 Compute and return the factorial of a number using while-loop
%  n = Factorial to compute
%  f = The computed factorial

    f = 1;            % Initialize the output variable f to 1.
    
    ErrorCheck(n);    % Calling a function to check whether the entered input is less than 1.
    
    while n > 1       % Iterate the while loop only if the input variable n is greater than 1 
        
        f = f * n;    % Mutiply f with n at each iteration and the factorial is returned.
        
        n = n - 1;    % Value of input variable is decremented by 1  at each iteration.
    
    end
end

function [] = ErrorCheck(n)

    if n < 1          % checks if the entered input is less than 1
        
        error('Factorial cannot be computed for negative values'); % throws an error if the entered input is negative.
        
    end
end

