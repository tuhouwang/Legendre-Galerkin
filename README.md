# Legendre-Galerkin
Three Legendre-Galerkin Spectral Methods for Solving Normal Modes of Underwater Acoustic Propagation
$$
\rho(z)\frac{\mathrm{d}}{\mathrm {d}z}\left(
        \frac{1}{\rho(z)}\frac{\mathrm{d}\psi(z)}{\mathrm {d}z}
    \right) + k^2(z)\psi(z) = k_r^2 \psi(z)
$$

```latex
    \frac{\mathrm{d}}{\mathrm {d}z}\left(
        \frac{1}{\rho(z)}\frac{\mathrm{d}\psi(z)}{\mathrm {d}z}
    \right) + \frac{k^2(z)\psi(z)}{\rho(z)} = \frac{k_r^2\psi(z)}{\rho(z)}
```

```latex
    \frac{4}{H^2}\frac{\mathrm{d}}{\mathrm {d}x}\left(
    \frac{1}{\rho(x)}\frac{\mathrm{d}\psi(x)}{\mathrm {d}x}
    \right) + 
    \frac{k^2(x)\psi(x)}{\rho(x)}{\mathrm {d}x} = 
    \frac{k_r^2\psi(x)}{\rho(x)}
```

```latex
    \frac{4}{H^2}\int_{-1}^{1}\chi(x)\frac{\mathrm{d}}{\mathrm {d}x}\left(
    \frac{1}{\rho(x)}\frac{\mathrm{d}\psi(x)}{\mathrm {d}x}
    \right){\mathrm {d}x} + 
    \int_{-1}^{1}\frac{k^2(x)\chi(x)\psi(x)}{\rho(x)}{\mathrm {d}x} = k_r^2\int_{-1}^{1}\frac{\chi(x)\psi(x)}{\rho(x)}{\mathrm {d}x}
```

```latex
    \psi(x)=\sum_{n=0}^N \hat{u}_n \phi_n(x), \quad \chi(x)=\phi_m(x)
```

```latex
    &\frac{4}{H^2}\sum_{n=0}^N \hat{u}_n \int_{-1}^{1}\phi_m(x)\frac{\mathrm{d}}{\mathrm {d}x}\left(
    \frac{1}{\rho(x)}\frac{\mathrm{d}\phi_n(x)}{\mathrm {d}x}
    \right){\mathrm {d}x} + \sum_{n=0}^N \hat{u}_n\int_{-1}^{1}\frac{k^2(x)\phi_m(x)\phi_n(x)}{\rho(x)}{\mathrm {d}x} = \\
    &k_r^2 \sum_{n=0}^N  \hat{u}_n\int_{-1}^{1}\frac{\phi_m(x)\phi_n(x)}{\rho(x)}{\mathrm {d}x}
```

```latex
    \mathbf{B}_{m,n}=\int_{-1}^{1}\frac{\phi_m(x)\phi_n(x)}{\rho(x)}{\mathrm {d}x}=
    \sum_{j=0}^{N}\frac{\phi_m(x_j)\phi_n(x_j)}{\rho(x_j)}w_j
```

```latex
    \mathbf{A}_{m,n}=\frac{4}{H^2}\int_{-1}^{1}\phi_m(x)\frac{\mathrm{d}}{\mathrm {d}x}\left(\frac{1}{\rho(x)}\frac{\mathrm{d}\phi_n(x)}{\mathrm {d}x}
    \right){\mathrm {d}x} + \int_{-1}^{1}\frac{k^2(x)\phi_m(x)\phi_n(x)}{\rho(x)}{\mathrm {d}x}
```

```latex
    \mathbf{A}_{m,n}=\frac{4}{H^2}\phi_m(x)\frac{1}{\rho(x)}\frac{\mathrm{d}\phi_n(x)}{\mathrm {d}x}\Big|_{-1}^{1}-\frac{4}{H^2}\int_{-1}^{1}\frac{1}{\rho(x)}\frac{\mathrm{d}\phi_n(x)}{\mathrm {d}x}\frac{\mathrm{d}\phi_m(x)}{\mathrm {d}x}{\mathrm {d}x}
    +\int_{-1}^{1}\frac{k^2(x)\phi_m(x)\phi_n(x)}{\rho(x)}{\mathrm {d}x}
```

```latex
    \mathbf{A}_{m,n}=-\frac{4}{H^2}\int_{-1}^{1}\frac{1}{\rho(x)}\frac{\mathrm{d}\phi_n(x)}{\mathrm {d}x}\frac{\mathrm{d}\phi_m(x)}{\mathrm {d}x}{\mathrm {d}x}
    +\int_{-1}^{1}\frac{k^2(x)\phi_m(x)\phi_n(x)}{\rho(x)}{\mathrm {d}x}
```

```latex
    \mathbf{A}_{m,n}=-\frac{4}{H^2}\sum_{j=0}^{N}\frac{\phi_m'(x_j)\phi_n'(x_j)}{\rho(x_j)}w_j+\sum_{j=0}^{N}\frac{k^2(x_j)\phi_m(x_j)\phi_n(x_j)}{\rho(x_j)}w_j
```
