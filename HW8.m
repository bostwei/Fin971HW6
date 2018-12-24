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


%%
%----------------- Firm's stationary decision ------------------------

% simulate 2000 firms
N = 2000;

% draw a random z from the stationary distribution. 
z = normrnd(0,sigma,N,1);

% we limite the z to be only 20 options in [-0.5,0.5], others' will use the
% interpolation to determined 
N_int = 20; 
z_space = linspace(-0.3,0.3,N_int)';

% calculate flowting profit and labor choice
 input.k = K;
 input.z = z_space;
 input.w = w;

 input.A =A;
 input.alpha_l = alpha_l ;
 input.alpha_k = alpha_k ;
 input.f = f;

 % here row is z 
% column is k
 out = static(input);
 pi = out.pi; % pi(z,k;w)
 l  = out.l;  % l(z,k;w)

%----------------- Firm's investment decision ------------------------ 

% i(k, k+1)
% - row is k
% - column is k+1
inv = kk' - (1-delta).* k;

inv_temp =  repmat(inv,1,1,N_int); % inv_temp(k,k+1,z;w)
pi_temp = zeros(Nk,Nk,N_int);
for i = 1:Nk
    pi_temp(:,i,:) = pi';
end

% determine whether need to incurr external finance
% inc(k,k+1,z;w)
% inc = zeros(Nk,Nk,N);
inc = pi_temp < inv_temp;
inc = double(inc);

% calculate the external finance cost
lambda = lambda0 + lambda1 .* (inv_temp - pi_temp).* inc;

% make entering decision
x = [ones(N,1), zeros(N,1)]; % this is entering decision



%


