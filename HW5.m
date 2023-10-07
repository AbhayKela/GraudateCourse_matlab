% Program to practice the assignment number 5
% Created by Abhay Kela on July 23, 2015

% Program for first problem to check the values for the given functions
x1 = [-9, -6, 0, 2, 5]; % Defining x1
y1 = [-10, -6, 2, 4, 6]; % Define y1
za = (x1 < y1); % Defining za
zb = (x1 > y1); % Defining zb
zc = (x1~=y1);  % Defining zc
zd = (x1 == y1); % Defining zd
ze = (x1 > 2); % Defining ze



% Program for second problem, to compare the value of stocks (in $)
price_A = [19, 18, 22, 21, 25, 19, 17, 21, 27, 29]; 
% It contains the value of stock A for any 10 days particular days
price_B = [22, 17, 20, 19, 24, 18, 16, 25, 28, 27]; 
% It contains the value of stock B for any 10 days particular days
price_C = [17, 13, 22, 23, 19, 17, 20, 21, 24, 28];
% It contains the value of stock C for any 10 days particular days

% a. To find the number of days value of stock A more than B&C;
stock_a=find (price_B<price_A>price_C);
% b. To find the number of days value of stock A more than B or C;
stock_b=find (price_B<price_A| price_A>price_C);
% c. To find the number of days value of stock A more than B or C;
stock_c=find (price_A>price_B|price_A>price_C);



% Program for third problem, sensor for monitoring water temperature
time= [0.00,1.00,2.00,3.00,4.00,5.00,6.00,7.00,8.00,9.00,10.00,11.00,12.00,13.00,14.00,15.00,16.00,17.00,18.00,19.00,20.00,21.00,22.00,23.00];
temp= [36,33,48,45,43,40,47,38,44,34,38,38,48,38,41,30,46,44,35,50,37,33,39,37];
temp_a=find (temp>=46);

% Program for forth problem, re-write the given function using if 
x=1;
y=3;
z=2;
if x<y && z<10 
    w=x*y*z
end

% Program for fifth problem, re-write the given function using if 
x=6;
format long
if (x<-1);
    y = exp(x+1)
elseif (-1<=x<5);
    y = 2+cos(pi*x);
elseif (x>5);
    y = 10*(x-5);
else
    disp('not valid');
end


% Program for 6th problem, using switch case function find the angle for
% given geometry and then calculate the interior angle of identified
% geometry
n=[3:1:6];
angle=(n-2)*180;
sum (angle);

geometry= 'pentagon'
switch product 
    case 'triangle'
        disp ('n=3')
    case 'square'
        disp ('n=4')
    case 'pentagon'
        disp ('n=5')
    case 'hexagon'
        disp ('n=6')
    otherwise 
        disp ('Geometry is not in file')
end
angle=(n-2)*180
fprintf ('The sume of interior angle is %d', angle)


% Program for 6th problem, using switch case function find the angle for
% given geometry and then calculate the interior angle of identified
% geometry

% Program to create a function for computing the distance x for different
% function of W
k1= 10^4; % The spring constant, unit is Newton per meter
k2= 1.5*10^4; % The spring constant, unit is Newton per meter
d= 0.1; % distance in meters

W=500;
x= (W/k1)

or

W=2000;
x= (W+(2*k2*d))/(k1+k2)