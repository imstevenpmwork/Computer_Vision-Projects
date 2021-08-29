function [LoG] = laplacian_of_gaussian(standard_deviation)

% standard deviation
sd = standard_deviation;

%spacial support is at least triple of standard deviation in each direction
sp=ceil(sd*3); 
[X,Y]=meshgrid(-sp:sp);

% Formula of second derivative of Gaussian
LoG = (1/(2*pi*sd^2))*((X.^2+Y.^2 -2*sd^2)/sd^4).*exp(-(X.^2+Y.^2)/(2*sd^2));
end

