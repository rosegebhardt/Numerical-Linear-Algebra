clear; clc; close all;
%% Rose Gebhardt - 11.3 %%

% Setup
format long 
m = 50; n = 12;
t = linspace(0,1,m);
A = fliplr(vander(t));
A = A(:,1:n);
b = (cos(4*t))';

% (a) Normal Equations
R1 = chol(A'*A);
x1 = R1\(R1'\(A'*b));

% (b) mgs function% 
[Q2,R2] = mgs(A);
x2 = R2\(Q2'*b);

% (c) house function
[W3,R3] = house(A);
Q3 = formQ(W3);
Q3 = Q3(:,1:n);
x3 = R3\(Q3'*b);

% (d) MATLAB built in command
[Q4,R4] = qr(A,0);
x4 = R4\(Q4'*b);

% (e) x = A\x
x5 = A\b;

% (f) SVD
[U,S,V] = svd(A);
x6 = V'\(S\(U'*b));

% Assuming that SVD provides the best calculation of x, the only terms that
% are appear to be signifcantly off are the last 5 terms of x1 (the normal
% equations) and x2 (mgs function). This implies that the normal equations
% and modified GS are less stable than the other methods. 
