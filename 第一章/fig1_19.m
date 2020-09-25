 close all 
 clear all 
 pt = 4; % peak power in Watts 
 freq = 94e+9; % radar operating frequency in Hz 
 g = 47.0; % antenna gain in dB 
 sigma = 20; % radar cross section in m squared 
 te = 293.0; % effective noise temperature in Kelvins 
 b = 20e+6; % radar operating bandwidth in Hz 
 nf = 7.0; %noise figure in dB 
 loss = 10.0; % radar losses in dB 
 range = linspace(1.e3,12e3,1000); % range to target from 1. Km 12 Km, 1000 points 
 snr1 = radar_eq(pt, freq, g, sigma, te, b, nf, loss, range); 
 Rnewci = (94^0.25) .* range; 
 snrCI = snr1 + 10*log10(94);  % 94 pulse coherent integration 
 % plot SNR versus range 
 figure(1) 
 rangekm = range ./ 1000; 
 plot(rangekm,snr1,'k',Rnewci./1000,snr1,'k -.') 
 axis([1 12 -20 45]) 
 grid
 legend('single pulse','94 pulse CI') 
 xlabel ('Detection range - Km'); 
 ylabel ('SNR - dB'); 
 % Generate Figure 1.20 
 snr_b10 = 10.^(snr1./10); 
 SNR_1 = snr_b10./(2*94) + sqrt(((snr_b10.^2)./(4*94*94))+(snr_b10./94)); % Equation 1.80 of text 
 LNCI = (1+SNR_1) ./ SNR_1; % Equation 1.78 of text 
 NCIgain = 10*log10(94) - 10*log10(LNCI);
 Rnewnci = ((10.^(0.1*NCIgain)).^0.25) .* range; 
 snrnci = snr1 + NCIgain; 
 figure (2) 
 plot(rangekm,snr1,'k',Rnewnci./1000,snr1,'k -.', Rnewci./1000,snr1,'k:') 
 axis([1 12 -20 45]) 
 grid 
 legend('single pulse','94 pulse NCI','94 pulse CI') 
 xlabel ('Detection range - Km'); 
 ylabel ('SNR - dB');
