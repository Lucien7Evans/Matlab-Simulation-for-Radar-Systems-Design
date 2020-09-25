Rref=86e3; 
tau_ref=.1e-6;
SNRref=20.;
snrref=10^(SNRref/10);
Sigmaref=0.1;
Lossp=2;
lossp = 10^(Lossp/10); % Enter desired value 
tau = tau_ref; 
R = 120e3; 
rangeratio = (Rref / R)^4; 
Sigma = 0.2; % Implement Eq. (1.60) 
snr = snrref * (tau / tau_ref) * (1. / lossp) * ... 
    (Sigma / Sigmaref) * rangeratio; 
snr = 10*log10(snr)
