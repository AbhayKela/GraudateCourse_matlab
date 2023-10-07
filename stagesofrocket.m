% Program to check if the missile in stage 1,2,3
% Created on July 22, 2015
% Created by Abhay Kela 
% The value of time is in seconds
clear;close;clc;
% t=102; % t=time in seconds
t=input('enter the value of time');

if t>=260
    disp ('it is a free flight')
elseif 170<=t && t<260
    disp ('missile is in stage 3')
elseif 101<=t && t<170
    disp ('missile is in stage 2')
elseif 50<=t && t<101
    disp ('missile is in stage 1')
else
    display('missile not yet fired')
end
