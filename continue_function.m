clear;clc;
A= [10 10 10 10];
i=0;
for n=2:2:8
    i= i+1;
    if (n==2)
        continue 
    end
    A(i)=n
end 