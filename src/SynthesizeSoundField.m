function tl = SynthesizeSoundField(r,z,zs,kr,rhozs,psi)

    psizs  = interp1(z,psi,zs,'linear');
    bessel = besselh(0,1,kr * r);
    p      = psi * diag( psizs ) * bessel * 1i * pi / rhozs;
    tl     = -20 * log10( abs(p) );

end
