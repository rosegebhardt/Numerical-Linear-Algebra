%% For Fun

clear all; close all; clc;

%% Define matrix of choice

N = 20;
A = rand(N);

for i = 1:N
    A(:,i) = A(:,i)/norm(A(:,i),1);
end

%% Watch the madness

for n = 1:N
    
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