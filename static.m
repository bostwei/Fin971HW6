function [out] = static(input)
%STATIC function calculate the profit and labor choice given k, z, w
%   
k = input.k';
z = input.z;
w = input.w;

A = input.A;
alpha_l = input.alpha_l;
alpha_k = input.alpha_k;
f = input.f;

% there row is z 
% column is k
% l(z,k;w)
l = (w ./( A .* exp(z) .* k.^alpha_k )) .^ (1 /( alpha_l - 1));

% pi(z,k;w)
pi = ( 1 - alpha_l) .* w .^(alpha_l /( alpha_l -1 )) .* ( A .* exp(z) .* ...
    k.^alpha_k ) .^ (1 /( 1 - alpha_l )) - f;

out.l = l;
out.pi = pi;
end

