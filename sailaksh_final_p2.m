function [L,scores] = sailaksh_final_p2(f)
% sailaksh_final_p2 Function performs Principal Component Analysis (PCA) to
% determine outliers from a given data set. Here, the data file is
% CityData.mat which contains ratings for 9 categories for 250 cities. PCA is performed
% on the ratings column which is 250x9 and the eigen values and scores are
% returned as output.
%
%   Inputs : f     - string containing the name of the data.
%   Outputs: L     - a column vector with eigen values ordered from largest
%                    to smallest.
%           scores - scores for all the principal directions.

      data = load(f);                       % The given input data is loaded into data using load().
      
      city_ratings = data.ratings;          % The ratings matrix is stored in city_ratings.
      
      [rows,columns] = size(city_ratings);  % The size (250x9) of the ratings matrix is stored in rows and columns.
      
      means = zeros(1,columns);             % means is initialized with a row vector(1x9) to store the column means.
      
      cov_matrix = zeros(columns);          % cov_matrix is initialized with a 9x9 matrix using zeros() to store the variances.
      
      for i = 1: columns                    % Iterate i from 1 to number of columns (ie., 9)
            
          %{
            
            Mean for each column or category is calculated by adding the
            ratings in each category and dividing it by number of rows.
          
          %}
          
          
          means(i) = sum(city_ratings(:,i))/rows;
      
      end
      
      for i = 1:columns                      % Iterate i from 1 to number of columns.
           
          %{
            
            The ratings are centered by subtracting the initial ratings
            with their column means (ie., shifting the data) such that the
            data has zero mean.
          
          %}
          
          city_ratings(:,i) = city_ratings(:,i) - means(i);
          
      end
      
      for i = 1: columns                      % Iterate i from 1 to number of columns.
          
          for j = 1:columns                   % Iterate j from 1 to number of columns.
              
              %{
                 
                 Since, the data is shifted already, the covariance between
                 two columns is calculated by mutiplying the ratings in both the columns 
                 and summing them together.
                 
                 Each obtained variance in the covariance matrix is divided
                 by n-1 (where n is number of rows)
                 and the obtained covariance matrix is stored in cov_matrix.
                 
              
              %}
              
              cov_matrix(i,j) = (1/(rows-1)) * sum(city_ratings(:,i).*city_ratings(:,j));
              
          end
          
      end
      
      [eigen_vectors, eigen_values] = eig(cov_matrix); % The eigen vectors and eigen values are extracted using eig().
      
      eigens = diag(eigen_values);                     % The diagonal values(eigen values) are extracted using diag().
      
      L = sort(eigens,'descend');                      % The obtained eigen values are sorted in descending order and returned in L.
      
      flipped_eigenvectors = fliplr(eigen_vectors);    % The obtained eigen vectors are flipped using fliplr() such that eigen vector corresponding to highest eigen value is obtianed as PC1.
      
      scores = city_ratings * flipped_eigenvectors;    % The principal scores are obtained by multiplying the shifted ratings with flipped eigen vectors.
      
      %plot(scores(:,1));                              % City with ID: 23 is the outlier with score 1.0e+04 * 5.3711.   
end

