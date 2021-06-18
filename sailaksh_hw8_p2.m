% sailaksh_hw8_p2 Script plots the time needed to compute the LU
% factorization for 50 random square matrices evenly spread in the range 
% from size n = 10 to 1000 using the functions sailaksh_hw8_p1, logspace, 
% tic and toc (to record the time taken for computation).

n = logspace(1,3,50);               % logspace(1,3,50) generates 50 evenly spread matrix sizes of the range 10 to 1000.
time_taken = zeros(1,length(n));    % Initialze a vector time_taken equal to size of n using zeros() to store the time required for LU decomposition. 

for i = 1:length(n)                 % Iterate i from 1 to number of columns of n (which is 50).
    
    k = round(n(i));                % The generated matrix sizes are rounded and stored in k.
    A = rand(k,k)+k*eye(k);         % Matrix A is randomly generated such that it is strictly diagonally dominant and doesnot require partial pivoting.
    tic;                            % tic indicates start of the timer.
        
      [L,U,P] = sailaksh_hw8_p1(A); % Using the function sailaksh_hw8_p1, LU decomposition with partial pivoting is performed on the obtained matrix A. 
               
    time_taken(i) = toc;            % The elapsed time required for LU decomposition is stored in time_taken.
    
end
loglog(n,time_taken);               % A plot of the time required for computation vs matrix size is produced using loglog() ie.,uses a logarithmic scale .
grid on
xlabel('Matrix sizes');             % xlabel and ylabel to describe what each axis represents.
ylabel('Time required for LU computation');
title('Matrix sizes vs Time required for LU decomposition');





