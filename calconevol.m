% This script calculates the volume of cone
clear;clc;
radius=input('Please enter the radius of cone');
height=input('Please enter the height of cone');
% It then call our function to calculate the 
% area and then print the result
outarg=conevol(radius, height);
fprintf('For a cone with a radius %.f units & height %.f units,',radius, height);
fprintf('the volume is %.f\n',outarg)