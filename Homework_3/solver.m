%% Rose Gebhardt -- Homework 03, Question 4b
clear all; clc; close all;
%% Solve system of equations 
% Given in question
A = [2,1,5,1;3,2,11,1;2,8,7,3;7,4,4,2];
b = [1;2;3;4];

% Factor A (Gives usual P, L, U)
[P,L,U] = GaussPP(A);

% Solve System (Gives solution x)
x = U\(L\(P*b));