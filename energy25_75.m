function [F25, F75] = energy25_75(r, fs)

N = length(r);

    % Energy spectrum of r
    % help fft
    % help abs
    R = (abs(fft(r))).^2;
    % Set DC term to zero
    R(1) = 0;
    f=(0:N-1)*fs/N;
    %help cumsum
    CR = cumsum(R);
    % normalisation
    CR = CR / max(CR);
    
    subplot(2,1,1)
    plot(f(1:N),R)
    hold on
    xlabel('frequency (Hz)')
    subplot(2,1,2)
    plot(f, CR)
    hold on
    
    
    % help find
    index = find (CR<0.25/2);
    F25 = (max(index)-1)*fs/N;

    index = find (CR<0.75/2);
    F75 = (max(index)-1)*fs/N;
    


