function [loc] = EAS501_Kritik2(A,x)
% EAS501_Kritik2 Function returns the first occurance of scalar x in the
% integer array A in the output variable loc. Returns loc = 0 if the scalar
% doesnot exist in the array.
% A = random integer vector
% x = scalar input to be searched
% loc = output variable.
    
    for i = 1:length(A)  % Iterate from 1 to length of the vector A.
        if A(i) == x     % Check if the search scalar x equals the element in the array A at index i.
            loc = i;     % If equals, assigns the index i(i.e., the first location of x in the array A) to output variable loc.
            break;
        else
            loc = 0;     % If x is not found in vector A, loc is assigned to 0.      
        end 
    end 
end
