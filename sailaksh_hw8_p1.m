function [L,U,P] = sailaksh_hw8_p1(A)
% sailaksh_hw8_p1 Function accepts a matrix A of size nxn 
% and computes LU Decomposition with partial pivoting and 
% produces three matrices L=Lower triangular matrix, U=Upper triangular
% matrix and P= Permutation matrix as outputs.
%   Input   A - nxn Square matrix
%   Outputs L = Lower triangular matrix
%           U = Upper triangular matrix
%           P = Permutation matrix
    
    [m,n] = size(A);                                      % Compute the size of the input matrix A and store the no. of rows in m and no.of columns in n.
    
    if m == n                                             % check if the input matrix is a square matrix(i.e., no.of rows==no. of columns)
        L = eye(m);                                       % Initialize L to identity matrix of size equal to size of input matrix A.
        U = A;                                            % Initialize U to input matrix A.
        P = eye(m);                                       % Initialize P to identity matrix of size equal to size of input matrix A.
        
        for k = 1:n-1                                     % Iterate k from 1 to n-1 (every row expect the last one) 
            
            [s,i] = max(abs((U((k:n),k))));               % Find the absolute maximum value below the current row using max()
            i = k+i-1;                                    % The location of the maximum value after modifications is stored in i.
             
            if abs(U(i,k)) >= 10^-8                       % check if the pivot is greater than or equal to 10^-8 (non-zero).                                          
                 U([k i],k:n) = U([i k],k:n);             % Swap i and k rows of U and L such that the value of pivot is maximum  
                 L([k i],1:k-1) = L([i k],1:k-1);         % and since it is numerically stable to divide by large numbers rather than small numbers.
                 P([k i],:) = P([i k],:);                 % Pivoting is done by swapping the rows of identity matrix.
                    
                 for j = k+1:n                            % Iterate j from k+1 to n (every remaining row).
                     L(j,k) = U(j,k)/U(k,k);              % Divide each column in U by the value in the pivot (lower triangular factor).
                     U(j,k:n) = U(j,k:n)-L(j,k)*U(k,k:n); % Perform operations between rows (subtract pivot rows from lower rows) so that values below pivot become zero.
                 end
            end
                
        end
            
    end
end

