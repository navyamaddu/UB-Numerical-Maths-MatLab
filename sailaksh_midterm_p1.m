function [w] = sailaksh_midterm_p1(x,y,funs)
% SAILAKSH_MIDTERM_P1 Function performs a least-squares fit for a given
% function basis.
%
% Inputs:
%   x - x-values to fit (1-D array of appropriate size).
%   y - y-values to fit (1-D array of appropriate size).
%   funs - A cell array containing the basis functions (non-numeric data).
%
% Output:
%   w - The least squares function weights(row or column vector based on the
%       dimensions of inputs) such that f(x) = w(1)*funs1(x)+w(2)*funs2(x)+....
%       is the interpolation function.

    %{ 
        The weigths can be approximated by using the least squares solution  
        A'* A * w = A'* y where A is the matrix obtained by evaluating the
        basis functions at input array x, A' represents the transpose of A 
        while y is the array containing the interpolated values and w is the array 
        containing the interpolated weights which are obtained using MATLAB's 
        linear system solver (\).
    %}
    
    %{ 
        Initialize matrix A with number of rows equal to length of input array x
        and number of columns equal to length of the funs (a cell array
        containing basis functions)using zeros().
        
     %}

    A = zeros(length(x),length(funs));  
    
    for i = 1:length(x)             % Iterate i from 1 to length of input array x.
        for j =1:length(funs)       % Iterate j from 1 to length of funs (basis functions).
            
            %{
            
              Matrix A is populated such that each element 
              represents each basis function evaluated at each element in x.
            
            %}
            
            A(i,j) = [funs{j}(x(i))];  
        end
    end
    
    m = size(y);                    % The size of input array y is stored in m.
    if m(1) == 1                    % check if the number of rows of y equals to 1 (i.e., row vector)
       
       %{
            To obtain the interpolated weights, we use MATLAB's linear
            system solver (\) which solves the linear system Ax=B. 
            
        %}
        
        %{
           If y is a row vector, we have to change the dimensions of y by
           applying transpose so that matrix multiplication is possible.
        
           Using least squares fit, we have A'* A * w = A' * y.
         
           By using w = (A'*A)\(A'*y'), we get the appropriate interpolated weights.
        
        %}
       w = (A'*A)\(A'*y');    
      
       w = w';                      % The obatined weights are then transposed so that the weight vector transforms to a row vector.
    
    else                            % If the input array y (interpolated values) is a column vector.
       
       %{
         
          If y is a column vector, using least squares fit, we have A'* A * w = A' * y.  
          By using w = (A'*A)\(A'*y), we get the appropriate interpolated weights.
        
        %}
       w = (A'*A)\(A'*y);     
   
    end
  
end

