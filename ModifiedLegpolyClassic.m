function [L,Lp] = ModifiedLegpolyClassic(N, x)
    
    [L,Lp] = legpoly(N, x);

    for k = 3 : N+1
        if(mod(k, 2) == 1)
            L (:, k) = L (:, k) - L (:, 1);%even,L_k(x)-L_0(x)
            Lp(:, k) = Lp(:, k) - Lp(:, 1);
        else
            L (:, k) = L (:, k) - L (:, 2);%odd, L_k(x)-L_1(x)            
            Lp(:, k) = Lp(:, k) - Lp(:, 2);
        end
    end
    
    L  = L (:,3:N+1);
    Lp = Lp(:,3:N+1);

end