function [length] = sailaksh_hw3_p1(A,i,j)
% sailaksh_hw3_p1 Function returns the minimum path length to connect two points (i->j) in a graph. 
% The input parameters, A represent Adjancency matrix,
% i is the departure point and j is the goal point.
% The output parameter length represents the minimum path length.
% Note: First non-zero element tells us the first minimum path length from i->j.

       
       length = 1;                      % The output variable 'length' is assigned to 1(i.e.,initialization).
       while length <= 20               % Iterate the while loop only if the minimum path length is less than or equal to 20.
           D = A^length;                % Adjacency matrix A is raised to the power of length and stored as D at every iteration. 
           if D(i,j) < 1                % minimum path length is incremented if there is a zero at position (i,j) in the new matrix D.
               length = length + 1;      
           else
               break;                   % The loop exits if we find the first non-zero element at position (i,j) in the new matrix D.
           end
       end
       if length > 20                   % If the minimum path length is greater than 20, an error is raised.
           error('Path length is greater than 20');
       end
end
           
  
        


