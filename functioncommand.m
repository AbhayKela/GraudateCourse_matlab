function functioncommand
a=10;
fprintf('a=');
fprintf('\n%5d',a);
a=-20;
fprintf('\n%5d\n\n',a);
a=[20;30];
fprintf('a=');
for i=1:2;  
fprintf('\n%5d\n',a(i))
end 
end 



