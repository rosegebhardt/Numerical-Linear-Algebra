clear; clc; close all;
%% Rose Gebhardt - 10.3 %%
Z = [1,2,3;4,5,6;7,8,7;4,2,3;4,2,2];

% mgs function
[Q1,R1] = mgs(Z);

% house and formQ functions
[W,R2] = house(Z);
Q2 = formQ(W);

% MATLAB built in command
[Q3,R3] = qr(Z,0);

%Each of these factorizations produces similar results. However...
%1. Q2 gives a full Q matrix while Q1 and Q3 provide reduced Q matrices. 
%2. R1 and Q1 have opposite signs from R2, R3, Q2, Q3. 