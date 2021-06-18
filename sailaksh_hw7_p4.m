function [dec] = sailaksh_hw7_p4(bin)
% sailaksh_hw7_p4 Function converts a 32-bit IEEE-754 binary string 
% into base-10 floating point number.
%   bin = Input 32-bit IEEE-754 binary string
%   dec = Output base-10 floating point number
    
    % check if the first bit (by converting the string to double 
    % using str2double) in the binary string is 1 or 0
    if(str2double(bin(1)) == 1)
        sign = (-1)^1;                 % sign is set to -1 if the first bit in the binary string is 1
    else
        sign = (-1)^0;                 % sign is set to +1 if the first bit in the binary string is 0.
    end
    
    % To calculate the exponent,
    % elements from 2 to 9 of the binary string are considered.
    exponent = bin(2:9);
    total = 0;
    for i = 1:length(exponent)         % Iterate from 1 to length of the exponent.
        j = str2double(exponent(i));   % converting each element of the string to double using str2double.
        total = total+(j*(2^(8-i)));   % each converted bit of the exponent is multipled by (2 raised to the power of 8-i).
    end   
    final_exponent = 2^(total-127);    % 2 is raised to the power of (total-127) and stored as final_exponent. 
   
    % To calculate the mantissa, 
    % elements from 9 to 32 of the binary string are considered.
    mantissa = bin(10:32);
    total2 = 0;                         
    for i = 1:length(mantissa)         % Iterate from 1 to length of mantissa.
        k = str2double(mantissa(i));   % each element of the mantissa is converted to double using str2double.
        total2 = total2+(k*(2^(-i)));  % each converted bit of the mantissa is multipled by (2 raised to the power of -i)
    end
    final_mantissa = 1+total2;         % 1 is added to the final total and stored as final_mantissa.
    
    % The given binary string is converted to decimal 
    % by multiplying the sign with obtained final_exponent and final_mantissa. 
    dec = sign*final_exponent*final_mantissa;
   
end

