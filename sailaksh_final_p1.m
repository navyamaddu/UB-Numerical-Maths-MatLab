function [mu,V] = sailaksh_final_p1(n)
% sailaksh_final_p1 Function returns sample means and variances
% of 'n' deflections and angles which are generated randomly using
% eas501_final_beamDeflection.p. The function eas501_final_beamDeflection
% takes in force of the tip F, the elastic modulus E, and the diamter of the beam d 
% where F, E and d obey Gaussian distribution with given means and variances
% as inputs and returns the deflection and angle of the tip of the circular
% cantilever beam.
%
%   Inputs : n  - The number of samples to draw.
%   Outputs: mu - 2x1 column vector with sample mean of deflection in
%                 location 1 and sample mean of angle in location 2.
%            V  - Covariance matrix between deflection and angle.

    rng(10);                                        % rng() specifies the seed such that same random values are generated at each iteration.   

    deflections = zeros(1,n);                       % Initialize the deflections with a row vector(1xn) of zeros.
    
    angles = zeros(1,n);                            % Initialize the angles with a row vector(1xn) of zeros.
    
    mu = zeros(2,1);                                % Initialize the output variable mu with a 2x1 column vector using zeros().
    
    V = zeros(2,2);                                 % Initialize the output covariance matrix V with a 2x2 matrix of zeros.
    
    random_force = normrnd(90,5,[1,n]);             % Generate a column vector of n random samples from gaussian distributed random variable force. 
        
    random_elastic = normrnd(195*10^9,3*10^9,[1,n]);% Generate a column vector of n random samples from gaussian distributed random variable elastic. 
        
    random_diameter = normrnd(12^-2,2*10^-4,[1,n]); % Generate a column vector of n random samples from gaussian distributed random variable diameter. 
    
    
    for i = 1:n                                     % Iterate i from 1 to number of random samples n.
        
        %{
        
         Each random force, elastic and diameter are given as inputs to
         eas501_final_beamDeflection() and the deflections and angles are
         captured and stored at each iteration.
        
        %}
        
        [deflect,angle] = eas501_final_beamDeflection(random_force(i),random_elastic(i),random_diameter(i));
        
        deflections(i) = deflect;
        
        angles(i) = angle;
        
    end
    
    mean_deflections = sum(deflections)/n;  % The mean deflection is calculated by summing up all the deflections and dividing by total number of deflections.
    
    mean_angles = sum(angles)/n;            % The mean angle is calculated by summing up all the angles and dividing by total number of angles.
    
    mu = [mean_deflections;mean_angles];    % The mean deflections and angles are stored in output variable mu at location 1 and location 2.
    
    for j = 1:n                             % Iterate j from 1 to n.
        
        %{
        
           The variance of the deflection, variance of angle and covariance between 
           deflection and angle are stored in the covariance matrix V.
        
        %}
        
        V(1,1) = V(1,1) + (deflections(j) - mean_deflections)^2;
        
        V(1,2) = V(1,2) + ((deflections(j) - mean_deflections) * (angles(j)-mean_angles));
        
        V(2,1) = V(2,1) + ((deflections(j) - mean_deflections) * (angles(j)-mean_angles));
        
        V(2,2) = V(2,2) + (angles(j) - mean_angles)^2;
        
        
    end
    
    %{
    
       Each obtained variance in the covariance matrix is divided by n-1 (where n is number of random
       samples) and the obtained covariance matrix is returned as output V.
    
    %}
    
    V(1,1) = V(1,1)/(n-1);                 
    
    V(1,2) = V(1,2)/(n-1);
    
    V(2,1) = V(2,1)/(n-1);
    
    V(2,2) = V(2,2)/(n-1);
    
end

