function [df] = EAS501_Kritik4a(f,x,h,order)
% EAS501_Kritik4a Function approximates the derivative of the input
% function f at x and grid spacing h using two possible finite-difference approximations.
%   Inputs : f - A Function handle to a function of one-variable. 
%            x - Locations where to compute the first derivative.Could be a
%            1D array.
%            h - The grid spacing(s) to use. This could be a 1D array of grid spacings.
%            order - The order of the method to use. This can be 1 or 2.
%            If order does not equals 1 or 2 return an error.
%   
%   Outputs : df - The approximated derivative of f at x.


    df = [];
    
    if ~(order == 1 || order == 2)                        % Check if the order is 1 or 2
        
        error('Order should be equal to 1 or 2');         % Display an error if order not equal to 1 or 2.
        
    end
    
    if length(x)>1 && length(h)>1                         % Check if both x and h are arrays
        
        error('Both x or h should not be arrays ');       % Return an error if both x and h are arrays.
        
    elseif length(h)>1                                    % if length of h is greater than 1 (ie., h is an array)
        
        for i = 1:length(h)                               % Iterate i from 1 to length(h)
            
            %{
                The first or second order finite-difference approximated derivative
                is calculated at scalar x and array h based on the input order 1 or 2.
            %}
            
            df(i) = (f(x+h(i))-f(x-(order-1)*h(i)))/(order*h(i));
            
        end
        
    elseif length(x)>1                                    % Check if x is an array (ie., length of x greater than 1).
    
        for i = 1:length(x)                               % iterate from 1 to length of x.
            
            %{
                The first or second order finite-difference approximated derivative
                is calculated at scalar h and array x based on the input order 1 or 2.
            %}
            
            
            df(i) = (f(x(i)+h)-f(x(i)-(order-1)*h))/(order*h);
            
        end
        
    else                                                  % If both x and h are scalars
        
        %{
             The first or second order finite-difference approximated derivative 
             is calculated at scalars x and h based on the input order 1 or 2.
        %}
        
        df = (f(x+h)-f(x-(order-1)*h))/(order*h);         
    
    end
    
end

