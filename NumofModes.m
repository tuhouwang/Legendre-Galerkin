function [nmodes,kr,V] = NumofModes(omega,kr,V,cpmax)

    [~,ind] = sort(real(kr),'descend');
    kr      = kr(  ind);
    V       = V (:,ind);

    cp = omega ./ real(kr);
    nmodes = 0;
    for i = 1 : length(kr)
        if(cp(i) <= cpmax )
            nmodes = i;
        end
    end

    if(nmodes == 0)
        error('Incorrect maximum phase speed input!');
    end

    kr = kr(1:nmodes);
    V  = V(:,1:nmodes);

end