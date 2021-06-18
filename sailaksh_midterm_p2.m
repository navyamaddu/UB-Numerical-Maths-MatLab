function [y] = sailaksh_midterm_p2(x,w,funs)
% SAILAKSH_MIDTERM_P2 Function evaluates an interpolation function
% such that y = w(1)*funs1(x)+w(2)*funs2(x)+....
%  
% Inputs:
%       x - Locations where to evaluate the interpolation function (1-D
%       array of appropriate size).
%       w - Weights of each function (1-D array of appropriate size).
%       funs - A cell array containing the basis functions (non-numeric data).
%  Output:
%       y - The interpolated values(row or column vector based on the
%       dimensions of inputs).

     %{ 
        The interpolated values can be obtained by using the least squares solution  
        A'* A * w = A'* y where A is the matrix obtained by evaluating the
        basis functions at input array x, A' represents the transpose of A, 
        w is the array containing the interpolated weights while y is the array 
        containing the interpolated values obtained using MATLAB's 
        linear system solver (\).
    %}

    %{ 
        Initialize matrix A with number of rows equal to length of input array x
        and number of columns equal to length of the funs (a cell array
        containing basis functions) using zeros().
        
     %}
    
    A = zeros(length(x),length(funs));
    
    for i= 1:length(x)          % Iterate i from 1 to length of input array x.
        for j=1:length(funs)    % Iterate j from 1 to length of funs (basis functions).
            
            %{
            
              Matrix A is populated such that each element 
              represents each basis function evaluated at each element in x.
            
            %}
             
            A(i,j) = [funs{j}(x(i))];
            
        end
    end
    
    C = A'* A;                % To calculate A'* A * w, we first mulitply A' with A and store it in C.             
    
    m = size(w);              % The size of input array w is stored in m.        
    
    if m(1) == 1              % check if the number of rows of w equals to 1 (i.e., row vector)
        
        %{
           If w is a row vector, we have to change the dimensions of w by
           applying transpose so that matrix multiplication is possible.
        
           (A'* A) is multiplied by transpose of w and stored in D.
        
        %}
        D = C * w';
        
        %{
            To obtain the interpolated values, we use MATLAB's linear
            system solver (\) which solves the linear system Ax = B.
            
            Comparing the equation A'* y = A'* A * w' with Ax = B, we obtain
            the interpolated values y as below.
            
        %}
        y = (A')\D;
        y = y';              % The obtained interpolated values are then transposed so that the y tranforms to a row vector.
    
    else                     % If the input weight vector w is a column vector.
       
         D = C * w;          % (A'* A) is multiplied by w and stored in D.
        
        %{
         
          If w is a column vector, using least squares fit, we have A'* A * w = A' * y.  
          By using y = A'\(A'* A * w), we get the appropriate interpolated values y.
        
        %}
        
        y = (A')\D;
    end  
end

