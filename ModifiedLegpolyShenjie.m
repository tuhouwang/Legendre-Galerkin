function [L,Lp] = ModifiedLegpolyShenjie(N, x)
    
    [L,Lp] = legpoly(N, x);

    for k = 1 : N-1
        L (:,k) = L (:,k) - L (:,k+2);
        Lp(:,k) = Lp(:,k) - Lp(:,k+2);
    end
    
    L  =  L (:,1:N-1);
    Lp =  Lp(:,1:N-1);

end