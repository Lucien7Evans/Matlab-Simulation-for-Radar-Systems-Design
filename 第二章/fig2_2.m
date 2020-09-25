clear all
close all
xg = linspace(-6,6,1500); % random variable between -6 and 6
xr = linspace(0,6,1500); % random variable between 0 and 6 
mu = 0; % zero mean Gaussian pdf mean 
sigma = 1.5; % standard deviation (sqrt(variance)) 
ynorm = normpdf(xg,mu,sigma); % use MATLAB function normpdf 
yray = raylpdf(xr,sigma); % use MATLAB function raylpdf 
plot(xg,ynorm,'k',xr,yray,'k-.'); 
grid 
legend('Gaussian pdf','Rayleigh pdf') 
xlabel('x')
ylabel('Probability density') 
gtext('\mu = 0; \sigma = 1.5') 
gtext('\sigma =1.5')