%**************************************************************
% Fin 971 HW 6
% Shiyan Wei
% 12/21/2018
%*************************************************************

%************************************************************
% This script is to sloving the general eql model of firms dynamics in
% Gomes(2001, AER)
%**************************************************************

clear 
close 
clc
%% Parameter Initiated

Nk = 200; % set grid = 200;


alpha_k = 0.3; % Share of capital
alpha_l  = 0.65; % Share of labor
delta = 0.145; % depreciation rate
rho = 0.762; % persistency of productivity
sigma = 0.0352; % sd of productivity shock
lambda0 = 0.08; % floatation cost of external finance
lambda1 = 0.28; % variational cost of external finance
beta = 1/1.065; % discount factor
H = 0.6; % preference to leisure

A = 1; % aggregate productivity
f = 0.01; % fixed cost of production

% initial guess of
w = 1.6;


% the capital space is 
klb = 0;
kub = 10;
K = linspace(klb,kub,Nk)'; % capitital space
k = K * ones(1,Nk); % current capital holding
kk = K * ones(1,Nk); % future capital holding choice


%----------------- Firm's stationary decision ------------------------

%% firm 




% simulate 2000 firms
N = 2000;

% draw a random z from the stationary distribution. 
z = normrnd(0,sigma,N,1);

% make entering decision
x = [ones(N,1), zeros(N,1)]; % this is entering decision

%


