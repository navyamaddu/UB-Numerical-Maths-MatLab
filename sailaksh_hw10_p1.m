function [l,v] = sailaksh_hw10_p1(A,v0)
% sailaksh_hw10_p1 Function implements the Rayleigh-Quotient iteration for
% the input matrix A and initial vector v0 and returns the resulting eigen value and 
% and the associated eigen vector.
%      Inputs : A  - Real, square and symmetric matrix whose eigen values
%                    and vectors need to be determined.
%               v0 - Initial vector such that norm(v0) = 1.
%      Outputs: l - Eigen value obtained after Rayleigh Quotient iteration.
%               v - associated eigen vector.
        
        tol = 10^-8;                        % Set the tolerance to 10^-8.
    
        s = size(v0);                       % The size of input vector v0 is stored in s.            
    
        if s(1) == 1                        % Check if the number of rows of v0 is 1 i.e., v0 is a row vector.
            
            v0 = v0';                       % convert the row vector to column vector i.e., transpose the initial vector v0.
            
        end
    
        v_k = v0/norm(v0);                  % Normalize the initial vector v0 and store the result in v_k.
    
        I = eye(size(A));                   % Initialize the identity matrix with the size equal to the size of matrix A.
    
        diff = 10;                          % Set the difference to 10.
    
        lambda_0 = transpose(v_k) * A * v_k;% Rayleigh Quotient for the normalized vector v0(i.e.,v_k) is stored in lambda_0.
   
        while diff > tol                    % Iterate the loop until difference is less than tolerance.
        
             temp_v = (A - lambda_0 * I) \ v_k;% Using linear system solver, solve for temp_v such that (A-lambda_0*I)*temp_v = v_k (where v_k is the normalized v_0).
       
             v_k =  temp_v/norm(temp_v);     % Normalize temp_v(i.e., the updated v) such that v_k is the resulting eigen vector.
       
             lambda_new = v_k'*A*v_k;        % Rayleigh Quotient for v_k is computed using v_k'*A*v_k to find the largest eigen value and stored in lambda_new.
       
             diff = abs((lambda_new-lambda_0)/lambda_new); % The absolute difference in the eigen values is calculated and stored in diff.
       
             lambda_0 = lambda_new;          % lambda_0 is updated with the obtained lambda_new(eigen value) in each iteration.
        
        end
    
        l = lambda_new;                      % The resulting eigen value is the lambda_new obtained when the convergence is reached using Rayleigh Quotient iterator.
    
        v = v_k;                             % The associated eigen vector v_k is stored in v.
end



