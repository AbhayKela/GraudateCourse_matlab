% This script asks the user for a type of pizzas
% and prints which type to order using a switch 

mypick=menu ('Pick a pizza','Cheese','Shroom','Sausages')
switch mypick
    case 1 
        disp ('order a pizza')
    case 2 
        disp ('order a mushroom pizza')
    case 3 
        disp ('order a sausage pizza')
    case 4 
        disp ('No pizzas for us today')
end 