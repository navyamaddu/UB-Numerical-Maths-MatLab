function [f] = sailaksh_hw12_p2(L,x,xList,yList)
% sailaksh_hw12_p2 Function evaluates the interpolating polynomial at
% location x given the data pairs xList and yList and the function handle L
% which evaluates the lagrange polynomial L(x,i,xList).
%   Inputs : L - function handle which returns the i-th Lagrange polynomial
%                evaluated at x from a list of x-loactions xList.
%            x - Location where the interpolating polynomial needs to be
%                evaluated.
%        xList - list of x-locations.
%        yList - List of y-loactions.
%
%   Output : f - The interpolating polynomial evaluated at the given inputs
    
     f = 0;                                 % Initialize the value of the interpolating polynomial function to zero.
        
     for i = 1:length(xList)                % Iterate i from 1 to length of x-locations.
            
         f = f + (yList(i) * L(x,i,xList)); % The value of interpolating function is obtained by mutiplying each value in yList with each Lagrange polynomial.
               
     end
     
end

