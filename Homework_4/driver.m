%% Rose Gebhardt, Yigal Kamel -- 29.1
clear all; close all; clc;
%% Part (c)

% Setup matrix
n = 4;
A = hilb(n);

% Setup vector of eigenvalues
e = zeros(n,1);

% Loop
T = tridiag(A);
sawtooth = [];

for m = n:-1:2
    [T_new, off_diag] = qralgc(T);
    e(m) = T_new(m,m);
    sawtooth = [sawtooth off_diag];
    T = T_new(1:m-1,1:m-1);
end

e(1) = T(1,1);

figure; semilogy(sawtooth);

%% Part (d)

% Setup matrix
n = 4;
A = hilb(n);

% Setup vector of eigenvalues
e = zeros(n,1);

% Loop
T = tridiag(A);
sawtooth = [];

for m = n:-1:2
    [T_new, off_diag] = qralgwilk(T);
    e(m) = T_new(m,m);
    sawtooth = [sawtooth off_diag];
    T = T_new(1:m-1,1:m-1);
end

e(1) = T(1,1);

figure; semilogy(sawtooth);

%% Part (e) -- No Shifts

% Setup matrix
A = diag(15:-1:1) + ones(15,15);
[n,~] = size(A);

% Setup vector of eigenvalues
e = zeros(n,1);

% Loop
T = tridiag(A);
sawtooth = [];

for m = n:-1:2
    [T_new, off_diag] = qralgc(T);
    e(m) = T_new(m,m);
    sawtooth = [sawtooth off_diag];
    T = T_new(1:m-1,1:m-1);
end

e(1) = T(1,1);

figure; semilogy(sawtooth);

%% Part (e) -- Wilkinson Shifts

% Setup matrix
A = diag(15:-1:1) + ones(15,15);
[n,~] = size(A);

% Setup vector of eigenvalues
e = zeros(n,1);

% Loop
T = tridiag(A);
sawtooth = [];

for m = n:-1:2
    [T_new, off_diag] = qralgwilk(T);
    e(m) = T_new(m,m);
    sawtooth = [sawtooth off_diag];
    T = T_new(1:m-1,1:m-1);
end

e(1) = T(1,1);

figure; semilogy(sawtooth);

%% Discuss rates of convergence

% Without a Wilkinson shift, it takes over 350 iterations to converge. With
% a Wilkinson shifts it only takes around 30 iterations. The convergence
% without shifts should be linear while the convergence with shifts should
% be cubic. The number of QR iterations per eigenvalue is the period of the
% sawtooth. This indicates how well the QR algorithm converges. 
