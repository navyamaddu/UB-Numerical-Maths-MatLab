function [R,p] = EAS501_Kritik3(A)
% EAS501_Kritik3 Function computes the Reduced row echelon form (RREF) 
% and the number of pivots of the input matrix A.
% A : Input variable - A rectangular or square matrix whose RREF needs to be
% calculated.
% R : Output variable which stores the computed RREF.
% p : Output variable which stores the number of pivots.
% A (augmented)matrix is in Reduced Row Echelon Form if
% 1.It is is Row Echelon Form
% 2.Each pivot is equal to 1.
% 3.The only non-zero in columns containing pivot is that pivot.

    
    [m,n] = size(A);                 % The dimensions of the input matrix A are stored in m(~rows),n(~columns) using size().
    for i = 1:min(m,n)               % Iterate from 1 to minimum of m,n.
        if A(i,i) ~= 0               % Check if the diagnol elements are equal to zero.
            A(i,:) = A(i,:)/A(i,i);  % If non zero, then normalize each row by pivot.      
        
            %{ 
              Here, each row of the matrix A is divided by the pivot in
              that row to make all the values of pivots equal to 1.
             %}
        
        end
   
        for j = 1:m                   % Iterate from 1 to number of rows m.
            if i ~= j                 % check if i not equal to j i.e., exculding the diagnol elements which are already equal to 1.
                
                A(j,:) = A(j,:)-(A(j,i)*A(i,:));
                
                %{
                   Here, the values of elements other than pivots are made
                   equal to zero. This is done in the following way:
                   if the first and second rows are [1,3,4,5,6] and
                   [2,1,3,4,5] then the first row is multiplied by 2 and
                   subtracted from the second row. This process repeates
                   for all the rows until all the elements other 
                   than pivots are zeros.
                %}
            end  
        end
    end
    
    R = A;                            % The computed RREF of the matrix A is stored in R.                                
    p = 0;                            % The number of pivots p is initialized to zero.
    
    for i = 1:min(m,n)                % Iterate from 1 to minimum of m,n i.e., rows and columns
        
        if(R(i,i) == 1)               % check if the diagnol element is equal to one.
            p = p+1;                  % Increment the value of p if the diagnol element is equal to one.
        end
    end

end
    
    




