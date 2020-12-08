clear;
close all;
clc;
% edit 'input_Galerkin.txt';
tic
[casename, N, nz, cpmax, dr, zs, dz, rmax, freq, H, ...
    tlmin, tlmax, alpha, dep, c, rho] = ReadEnvParameter('input_Galerkin.txt');

omega  = 2 * pi * freq;
nr     = rmax / dr;
r      = dr : dr : rmax;

[x, w]  = legpts(nz);
z  = (1 + x) .* H / 2.0;
zr = 0 : dz : H;
xr = 2 ./ H * zr' - 1;

c      = interp1(dep,   c,   z, 'linear');
alpha  = interp1(dep, alpha, z, 'linear');
rho    = interp1(dep,  rho,  z, 'linear');
rhozs  = interp1(z,    rho, zs, 'linear');

k  = omega ./ c .* (1.0 + 1i * alpha / (40.0 * pi * log10( exp(1.0) ) ) );
k  = k .^ 2;


% [L, Lp] = ModifiedLegpolyEvans(N, x);
% [L, Lp] = ModifiedLegpolyClassic(N, x);
[L, Lp] = ModifiedLegpolyShenjie(N, x);

A = zeros(N - 1, N - 1);
B = zeros(N - 1, N - 1);

for i = 1 : N - 1
    for j = i : N - 1     
          A(i, j) = - LGQuadrature(Lp(:, i) .* Lp(:, j) ./ rho, w) * 4 / H ^2 ...
                    + LGQuadrature(L (:, i) .* L (:, j) .* k ./ rho, w);
   
          B(i, j) = LGQuadrature(L(:, i) .* L(:, j) ./ rho, w);
          A(j, i) = A(i, j);
          B(j, i) = B(i, j);
    end
end

[V, kr] = eig(A, B);
kr      = sqrt(diag(kr));

% ShowWavenumbers(kr, casename);

d = 1.0 ./ sqrt(diag(V.' * B * V));
V = V * diag(d ./ sqrt(H / 2));

[nmodes, kr, V] = NumOfModes(omega, kr, V, cpmax);

% psi = InvLGEvans(V, xr);
% psi = InvLGClassic(V, xr);
psi = InvLGShenjie(V, xr);

tl  = SynthesizeSoundField(r, zr, zs, kr, rhozs, psi);

ShowSoundField(r, zr, tl, tlmin, tlmax, casename);

toc
