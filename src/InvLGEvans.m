function ux = InvLGEvans(V,xr)
    
    N = size(V, 1) + 1;
    [L, ~] = ModifiedLegpolyEvans(N,xr);    
    ux = L * V;
    
end
