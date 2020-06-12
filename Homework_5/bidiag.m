%% Rose Gebhardt & Yigal Kamel -- 34.3
clear all; close all; clc;

%% Part A

% Size of A
N = 64;

% Define diagonal terms
q = 1./sqrt(linspace(1,N,N));

% Initialize A
A = diag(q);

% Add off-dagonal terms
for k = 1:N-1
    A(k,k+1) = q(k);
end

%% Part B

% Iterate for steps for Arnoldi algorithm
for n = 1:30
    
    % Get eigenvalue approximations
    [~,~,e] = arnoldi(A,n);
    
    % Plot true eigenvalues
    plot(real(eig(A)),imag(eig(A)),'o');
    hold on
    
    % Plot approximate eigenvalues
    plot(real(e),imag(e),'*');
    hold off
    
    % Pause
    pause;
    
end

% Comment on results: The eigenvalue approximations tend toward the
% dominant eignevalues of A. The eigenvalues toward the left do not
% converge as well as those toward the right.

%% Part C

% Get H_tilda for n = 5,10,15,20
[~,H_5] = arnoldi(A,5);
[~,H_10] = arnoldi(A,10);
[~,H_15] = arnoldi(A,15);
[~,H_20] = arnoldi(A,20);

% Comment on results: The psusdospectra of H_tilda at different values of n
% do not appear to match the cooresponding pseudospectra of A very well. 

