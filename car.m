function [d,v, a] = car(t)
%function to calculate distance(d), velocity(v), and
%acceleration(a) of a car
a = 0.5 .*t;
display(a);
v = a .*t;
display(v);
d = v .*t;
display(d);
end