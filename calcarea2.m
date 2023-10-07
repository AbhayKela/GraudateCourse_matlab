% This script calculates the area of circle
% It prompts for the radius 
clear;clc;
radius=input('Please enter the radius of circle');
% It then call our function to calculate the 
% area and then print the result
area=calcarea(radius);
fprintf('For a circle with a radius of %.f,',radius)
fprintf('the area is %.f\n',area)
