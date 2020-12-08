function [casename, N, nz, cpmax, dr, zs, dz, rmax, freq, H, tlmin, tlmax, ...
    alpha, dep, c, rho] = ReadEnvParameter(env_file)
  
    fid      = fopen(env_file);
    casename = fgetl(fid);
    N        = fscanf(fid, '%d', 1);
    nz       = fscanf(fid, '%d', 1);
    cpmax    = fscanf(fid, '%f', 1);
    freq     = fscanf(fid, '%f', 1);
    zs       = fscanf(fid, '%f', 1);
    dz       = fscanf(fid, '%f', 1);
    rmax     = fscanf(fid, '%f', 1);
    dr       = fscanf(fid, '%f', 1);
    H        = fscanf(fid, '%f', 1);
    tlmin    = fscanf(fid, '%f', 1);
    tlmax    = fscanf(fid, '%f', 1);
    n        = fscanf(fid, '%d', 1);
    
    if(H >0.0  &&  N>2)
        Profile    = fscanf(fid, '%f %f', [4, n]);
        dep(1:n)   = Profile(1, 1:n);
        c(1:n)     = Profile(2, 1:n);
        rho(1:n)   = Profile(3, 1:n);
        alpha(1:n) = Profile(4, 1:n);
    else
        error('Error! H must greater than 0!');
    end
    
    % Check the input sound profile
    if(dep(1) ~= 0.0 || dep(n)~= H)
        error('Error! input sound profile is unsuitable!');
    end
    
    if(nz < N)
        error('Warning! nz should greater than N!');
    end
    
    if((H / dz - floor(H / dz)) ~= 0)
        error('Error! The input dz unsuitable!');
    end

    if((rmax / dr - floor(rmax / dr)) ~= 0)
        error('Please reinput the dr and rmax!');
    end

    if(tlmin >= tlmax)
        error('tlmin must less than tlmax!');
    end

    fclose(fid);
    
end
