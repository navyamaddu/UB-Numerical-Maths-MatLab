function [f] = sailaksh_hw1_p2(n)
%sailaksh_hw1_p2 Compute and return the factorial of a number n using for-loop
%  n = Factorial to compute
%  f = The computed factorial

    f = 1;               % Initialize the output variable f to 1.
    
    ErrorCheck(n);       % Calling a function to check whether the entered input is less than 1.
    
    for x = 1 : n        % Iterate from 1 to the given input number n
       
        f = f * x;       % Mutiply x with f and the factorial of the entered input is returned
            
    end
end

function [] = ErrorCheck(n)

    if n < 1              % checks if the entered input is less than 1
        
        error('Factorial cannot be computed for negative values'); % throws an error if the entered input is negative.
        
    end
end
