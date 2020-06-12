%% Rose Gebhardt, Yigal Kamel -- 26.2

clear all; close all; clc;

%% Define matrix

m = 32;
A = -1*eye(m);
for i = 1:m
    for j = 1:m
        if j == i+1 || j == i+2
            A(i,j) = 1;
        end
    end
end

% Use this matrix in EigTool

%% Semilogy Plot

% Find spectral abscissa
v = eig(A);
alpha = max(real(v));

% Set array sizes
t = linspace(0,50,1000);
y_1 = zeros(1000,1);
y_2 = zeros(1000,1);

% Get curve of norm and straight line asymptote
for i = 1:1000
    y_1(i) = norm(expm(t(i)*A));
    y_2(i) = norm(expm(t(i)*alpha));
end
   
% Plot curves
figure(1)
semilogy(t,y_1,t,y_2)
%legend('||e^{tA}||_2','Spectral Abscissa')

%% Relation to Pseudospectra

% There should not be any growth before decay because all the eigenvalues are negative. With perterbation of the
% eigenvalues howewver, some of the eigenvalue may end up having a positive real component which is why some 
% growth is initially observed.
