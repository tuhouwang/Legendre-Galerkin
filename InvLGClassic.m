function ux = InvLGClassic(V,xr)

    N = size(V, 1) + 1;
    [L, ~] = ModifiedLegpolyClassic(N,xr);    
    ux = L * V;
    
end