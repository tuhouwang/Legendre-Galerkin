function [L,Lp] = ModifiedLegpolyEvans(N, x)
    
    [L,Lp] = legpoly(N, x);
    
    if(mod(N, 2) == 0)
        for k = 1 : N+1
            if(mod(k,2) == 1)
                L (:, k) = L (:, k) - L (:, N+1);
                Lp(:, k) = Lp(:, k) - Lp(:, N+1);
            else
                L (:, k) = L (:, k) - L (:, N);        
                Lp(:, k) = Lp(:, k) - Lp(:, N);
            end
        end
    else
        for k = 1 : N+1
            if(mod(k, 2) == 1)
                L (:, k) = L (:, k) - L (:, N);
                Lp(:, k) = Lp(:, k) - Lp(:, N);
            else
                L (:, k) = L (:, k) - L (:, N+1);         
                Lp(:, k) = Lp(:, k) - Lp(:, N+1);
            end
        end
    end
    
    L  = L (:,1:N-1);
    Lp = Lp(:,1:N-1);
    
end