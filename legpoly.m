function [L, Lp] = legpoly(N,x)
%LEGPOL   Legendre polynomials of degree N.
%   L = LEGPOLY(N,X) returns the Legendre polynomials and their derivatives 
%   for degree k=0:N at points X.
%   [L LP] = LEGPOLY(N,X) returns the Legendre polynomials and their 
%   derivatives for degree k=0:N at points X.
%   
%   The i-th row and j-th column of L and LP stores L_j(x_i) and L'_j(x_i)
%   respectively.
%
%   Example: plot the first 5 Legendre polynomials
%        x = linspace(-1,1,100);
%        L = legpoly(4,x);
%        plot(x,L);
%
%   See also   LEGENDRE, LEGGAUSSLOBNODEWEIGHT

%   2014/05/29

% Preallocate L and L' matrices and give L_0, L_1, L'_0, L'_1 at x_i
L = zeros(length(x),N+1);
Lp = L;
x = x(:);
L(:,1) = ones(length(x),1);
L(:,2) = x;
Lp(:,2) = L(:,1);
% Use the three-term and two-term recurrence relation
for k = 2:N
    L(:,k+1) = (2*k-1)/k*x.*L(:,k) - (k-1)/k*L(:,k-1);
    Lp(:,k+1) = Lp(:,k-1) + (2*k-1)*L(:,k);
end