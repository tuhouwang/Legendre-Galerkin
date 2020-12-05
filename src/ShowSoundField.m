function ShowSoundField(r,z,tl,tlmin,tlmax,casename)

    figure;
    disp('plot the transmission loss field!');
    pcolor( r, z, tl); 
    caxis( [tlmin tlmax] ); colormap( flipud(jet) );
    shading flat; colorbar; view( 0, -90 );
    xlabel( 'Range (m)')  ; ylabel( 'Depth (m)');
    colorbar( 'YDir', 'Reverse' );title(casename);
    set(gca,'FontSize',16,'FontName','Times New Roman');

end
