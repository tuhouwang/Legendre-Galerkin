function integral = LGQuadrature(f,w)
 
    n  = length(f);
    integral = 0;
    
    for k = 1 : n
         integral = integral + w(k) * f(k);
    end

end
