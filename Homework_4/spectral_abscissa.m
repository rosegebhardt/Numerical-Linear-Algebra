%% Rose Gebhardt, Yigal Kamel -- 24.3
clear all; close all; clc;
%% Question 24.3

% Size of matrix
m = 10;

% Set array sizes
t = linspace(0,20,1000);
y_1 = zeros(1000,1);
y_2 = zeros(1000,1);

% Start a new figure
figure(1)

% Evaluate 10 random matrices
for j = 1:10
    
    % Define matrix, find eigenvalues
    A = randn(m,m) - 2*eye(m);
    v = eig(A);
    
    % Define spectral abscissa
    alpha = max(real(v));
    
    % Get curve of norm and straight line asymptote
    for i = 1:1000
        y_1(i) = norm(expm(t(i)*A));
        y_2(i) = norm(expm(t(i)*alpha));
    end
    
    % Show dominant pole -- compare to behavior
    [~,r] = max(real(v));
    v(r);
   
    % Add curve as a subplot
    subplot(5,2,j)
    semilogy(t,y_1,t,y_2)
    %legend('||e^{tA}||_2','Spectral Abscissa')

end