function [num] = sailaksh_hw3_p2(A,i,j,n)
%sailaksh_hw3_p2 Function returns the total number of paths of 
%length<=n connecting 2 points (i->j) in a graph.
%   The input paramters are A - Adjacency matrix
%   i is the departure point and j is the goal point
%   n is the maximum path length.
%   The output variable num represents the total number of paths.
%   For instance, If the maximum path length is 3, the total number of paths of length <=3 are calculated 
%   i.e., total paths of lengths 1 , 2 and 3 are added to find the total number of paths. 

            num = 0;                % The output variable total number of paths 'num' is set to zero.      
            for k = 1:n             % Iterate k from 1 to maximum path length n. 
                D = A^k;            % The Adjacency matrix A is raised to the power of k at each iteration and stored in a new matrix D.
                num = num + D(i,j); % The total number of paths(i.e., the value of (i,j) in the new matrix D)are added for each k.
            end
end

