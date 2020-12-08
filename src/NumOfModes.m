function [nmodes, kr, V] = NumOfModes(omega, kr, V, cpmax)

    [~, ind] = sort(real(kr), 'descend');
    kr       = kr(   ind);
    V        = V (:, ind);

    cp = omega ./ real(kr);
    
    nmodes = length( find( cp <= cpmax ) );

    if (nmodes == 0)
        error('Incorrect maximum phase speed input!');
    end

    kr = kr(   1:nmodes);
    V  = V (:, 1:nmodes);

end