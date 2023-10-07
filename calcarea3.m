% This script calculates the area of a rectangle
% It prompts for the lenght and height 
clear;clc;
value1=input('Please enter the Lenght of rectangle');
value2=input('Please enter the height of rectangle');
% It then call our function to calculate the 
% area and then print the result
area=calcarea1(value1,value2);
fprintf('\nFor a circle with a Length %.f units & Height %.f units,',value1,value2);
fprintf('the area is %.f sq.units\n',area);
