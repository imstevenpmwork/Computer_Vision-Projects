****************************************
Laboratory Session 1 - Computer Vision
Universita Degli Studi di Genova

Justin Lee (S4885003)
Steven Palma Morera (S4882385)

2020-03-20
****************************************

Instructions for running the MATLAB scripts:
Each script is a function, so in order to use them properly
the reader should call the functions from the MATLAB workspace

1. Be sure to change the MATLAB working directory to the folder
named '0_Matlab Scripts'
2. Call the functions from the MATLAB workspace like shown below:
	
For translation-> translateimg(Translation on the X axis in pixels (double),Translation on the Y axis in pixels (double),'name_of_image.jpg');
	Example-> translateimg(-87.1,23.5,'boccadasse.jpg');

For rotation-> rotateimg(Amount of radians that the image will be rotated along its center (float),'name_of_image.jpg');
	Example-> rotateimg(-1.812,'flower.jpg');

For the custom transformation-> warpingimg('name_of_image.jpg','name_of_the_data.mat');
	Example for the flower image-> warpingimg('flower.jpg','data_flower.mat');
	Example for the landscape image-> warpingimg('boccadasse.jpg','data.mat');
