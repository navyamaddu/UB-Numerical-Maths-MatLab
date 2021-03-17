function [result]= EAS501_SP21_Kritik1(f)
% EAS501_SP21_Kritik1 Fuction that has a function handle f and 
% returns result = 1 if the function works correctly and
% returns result = 0 if the function works incorrectly and 
% returns result = -1 if the function fails to run.
% 
% The function handle f takes two inputs f(A,x) : an integer array A and a scalar x and returns
% loc i.e., the first occurence of the scalar x in the integer array. 
% loc = 0 is returned if the scalar doesnot exist in the integer array.

   
    x = 24;                         % scalar to be searched in the array is set to 24.
    A = randi([1,25],1,100);        % A random integer row vector with length 100 generated using randi.
    B = randi([1,25],100,1);        % A random integer column vector with length 100 ranging from 1 to 25
    C = randi([1,15],1,75);         % A random integer row vector with length 100 ranging from 1 to 15 where the search scalar 24 doesnot exist.
    
    try
        loc1 = f(A,x);              % The output of function handle with row vector and x is stored in loc1.
        loc2 = f(B,x);              % The output of function handle with column vector and x  is stored in loc2.
        loc3 = f(C,x);              % The output of function handle with row vector and x is stored in loc3.
        
        switch loc1                 % switch cases to verify loc1
            case 0
                for k = 1:length(A) % Iterate from 1 to length of the vector A.
                    if A(k) == x    % flagA is set to zero if the vector A contains the scalar x
                        flagA=0;
                    else
                        flagA=1;    % flagA is set to 1 if the vector A doesnot contain x.
                    end
                end
            otherwise 
              if A(loc1)==x         % check if search scalar x exists in vector A at loc1. If exists, flagA variable is set to 1.
                flagA = 1;          
              else
                flagA = 0;          % flagA is set to 0 if vector doesnot contain scalar x at the location returned by the function.
              end       
        end
        
        
        switch loc2                 % switch cases to verify loc2
            case 0
               for kb = 1:length(B) % Iterate from 1 to length of the vector B.
                if B(kb) == x       % flagB is set to zero if the vector B contains the scalar x
                    flagB=0;
                else
                    flagB=1;        % flagB is set to 1 if the vector B doesnot contain x.
                end
               end
            otherwise 
              if B(loc2)==x         % check if search scalar x exists in vector B at loc2. If exists, flagB variable is set to 1.
                flagB = 1;         
              else
                flagB = 0;          % flagB is set to 0 if vector doesnot contain scalar x at the location returned by the function.
              end       
        end
        switch loc3                 % switch cases to verify loc3
            case 0                  % if loc3==0
                for i=1:length(C)   % Iterate from 1 to length of the vector C.
                    if C(i) == x    % flagC is set to zero if the vector C contains the scalar x.
                        flagC = 0;
                        break;
                    else
                        flagC = 1;  % flagC is set to 1 if the vector C doesnot contain x.
                    end
                end
            otherwise               % if loc3==1 
                flagC = 0;          % set flagC to 0 since we know that the vector doesnot contain the scalar x.
        end
        
        if flagA == 1 && flagB == 1 && flagC == 1  % check if flagA,flagB and flagC are equal to 1. 
            result = 1;             % Set the result to 1 indicating that the function is working correctly
        else
            result = 0;             % else set the result to 0 indicating that the function is working incorrectly
        end
        
    catch
        result = -1;                % if the program fails to run, catch block executes and sets the result to -1.
    end
end