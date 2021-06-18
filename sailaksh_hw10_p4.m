function [B] = sailaksh_hw10_p4(A,p)
% sailaksh_hw10_p4 Function accepts a matrix A and rank p (with p less than 
% or equal to rank(A)) and returns the rank-p matrix B that is best approximation to A . 
% If p is greater than rank(A), then the best approximation would be matrix A itself.
%   Inputs : A - Input matrix whose best approximation needs to be determined.
%            p - Input rank with p <= rank(A) else the function returns
%                input matrix A as best approximation.
%   Output : B - Rank-p approximation of matrix A(summation of rank-1
%                matrices)
    
    if p > rank(A)                      % Check if the input rank p is greater than rank of A.   
        
        B = A;                          % If p > rank(A), then the best approximation would be matrix A itself.
   
    else                                % If p is less than or equal to rank of A.
        
        [U,S,V] = svd(A);               % Now, singular value decomposition is performed on matrix A such that U, V(Unitary Matrices) and S(diagonal matrix) are obtained.
        
        B = zeros(size(A));             % Initialize B with the zeros equal to size of A.
        
        h = diag(S);                    % Using diag(), the diagonal values of S i.e., singular values are extracted.
        
        for j = 1:length(h)             % Iterate j from 1 to length of h(all the singular values).
            
            if h(j) < 10^-10            % check if any singular value is less than 10^-10.
                
                h(j) = 0;               % Consider the values less than 10^-10 as zeros.
                
            end
            
        end
        
        for i = 1:p                     % Iterate i from 1 to input rank p.
            
            %{
                Now, the best approximation is obtained by mutiplying each
                singular value with the corresponsing column of Unitary
                matrix U and the transpose of corresponsing column in
                Unitary matrix V (i.e.,h(i) * U(:,i) * transpose(V(:,i)))
                
                The summation of rank-approximations for each i (upto input rank-p) gives the best
                rank-p approximation matrix B
            %}
            
            B = B + (h(i) * U(:,i) * transpose(V(:,i))) ;  
        
        end  
    end
end

