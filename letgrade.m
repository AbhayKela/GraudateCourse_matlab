
% letgrade returns the letter grade corresponding
% to integer quiz grade argument
% format of call: letgrade (integerQuiz)
% returns a character

%First, error-check
if quiz<0 || quiz>10
%     grade='X';
    % If here, it is valid so figure out the
    % corresponding letter grade
elseif quiz==9|| quiz==10
    grade='A';
elseif quiz==8
    grade='B';
elseif quiz==7
    grade='C';
elseif quiz==6
    grade='D';
else
    grade 'F';
end



