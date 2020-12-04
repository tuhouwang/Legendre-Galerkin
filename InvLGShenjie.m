function ux = InvLGShenjie(V,xr)

    N = size(V, 1) + 1;
    [L, ~] = ModifiedLegpolyShenjie(N,xr);    
    ux = L * V;
    
end