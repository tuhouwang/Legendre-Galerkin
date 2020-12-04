function ShowWavenumbers(kr,casename)

    figure;
    disp('plot the modal wavenumbers!');    
    plot(real(kr),imag(kr),'r*');grid on;
    xlabel('Real Wave Number (1/m)');title(casename);
    ylabel('Imaginary Wave Number (1/m)');
    set(gca,'FontSize',14,'FontName','Times New Roman');

end