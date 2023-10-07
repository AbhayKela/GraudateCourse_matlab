% Program for home work 4  
% Created by Abhay Kela 
% Created on July 17, 2015
% Problem statement  2, program to compute the time required to reach the
% specific height 
% Let height h be 100 meters 
% Let time T in sec
% Let the acceleration due to gravity g be 9.81 meters per sqaure sec 
% At t=2.7328 we ger height=100 meters

function [output]=HW4b(t)
output=50*t-(1/2*(9.81*t^2));
result=[output',t']
end