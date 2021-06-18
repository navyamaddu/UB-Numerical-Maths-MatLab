% sailaksh_hw8_p4 Script will study the loss of orthogonality that can
% occur using the Gram - Schmidt procedure for ill- conditioned matrices.

% Here, we are using Hilbert matrices of sizes 2 to 11 as ill-conditioned matrices
% and using four different QR decompositions - Classical, Modified,
% Householder Reflectors (using the provided .p files) and Matlab's QR function 
% to obtain unitary matrix Q. 

% We then calculate ||tranpose(Q)*Q-I || using obtained Q's and the plot
% the norms against matrix sizes.

% Initialize 4 empty column matrices of size 10 to store all the calculated norms using zeros(). 

classical_norms = zeros(1,10);     
modified_norms = zeros(1,10);
householder_norms = zeros(1,10);
matlab_qr_norms = zeros(1,10);

for i = 2 : 11                                  % Iterate i from sizes 2 to 11.
   
   hilb_matrix = hilb(i);                       % Generate ill-conditoned hilbert matrices of each size at each iteration.
   
   I = eye(i);                                  % Initialize an identity matrix of size equal to size of the hilbert matrix.
   
   %{
      Now, the hilbert matrices are given as input to the provided .p files
      and they perform the QR decomposition on the input hilbert
      matrices using Classical, Modified and Householder methods and
      provides Q matrix as output. 
      
      Now the 2-norm (i.e.,||tranpose(Q)*Q-I||)
      is calculated for each method and stored into the respective vectors.
   %}
   
   q_classical = qr_classical(hilb_matrix);
   classical_norms(i) = norm(transpose(q_classical)*q_classical-I);
   
   q_modified = qr_modified(hilb_matrix);
   modified_norms(i) = norm(transpose(q_modified)*q_modified-I);
   
   q_householder = qr_householder(hilb_matrix);
   householder_norms(i) = norm(transpose(q_householder)*q_householder-I);
   
   [q_matlab_qr,r] = qr(hilb_matrix);
   matlab_qr_norms(i) = norm(transpose(q_matlab_qr)*q_matlab_qr-I);
    
end

%{
    The obtained norms are then plotted against matrix sizes and axes are
    labelled accordingly along with the legend.

    hold on is used to hold the output such that all the methods are
    plotted on the same graph.
%}

semilogy(classical_norms);
hold on
semilogy(modified_norms);
hold on
semilogy(householder_norms);
hold on
semilogy(matlab_qr_norms);
hold off
legend('Classical','Modified','Householder','Matlab QR');
legend('Location','northwest');
xlabel('Matrix sizes')
ylabel('|| transpose(Q)*Q-I ||');
title('Hilbert matrices vs || transpose(Q)*Q-I || for different methods');

