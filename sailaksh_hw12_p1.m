function [l] = sailaksh_hw12_p1(x,i,xList)
% sailaksh_hw12_p1 Function returns the i-th Lagrange polynomial at 
% location x from a list of x-locations xList.
%
%   Inputs :  x - location where the Lagrange polynomial needs to be computed.
%             i - represents which Lagrange polynomial needs to be computed.
%         xList - list of x-locations.
%
%   Output :  l - value of the Lagrange polynomial evaluated at x.
    
    l = 1;                               % The value of the i-th Lagrange polynomial is initialized to 1.
    
    for j = 1:length(xList)              % Iterate j from 1 to length of x-loactions xList.
        
        if j ~= i                        % Check if j is not equal to the input i.
            
            num = (x - xList(j));        % Numerator of the lagrange polynomial which doesnot include the i-th element from xList.
            
            den = (xList(i)-xList(j));   % Denominator of the lagrange polynomial evaluated at i-th element of xList.
            
            l =  l * (num/den);          % At each iteration, the values computed from the x-locations are multiplied and returned as value of lagrange polynomial l.
            

        end
        
    end
        
end

