function isOver = checkGameOver(knight1,knight2)
% Filename: checkGameOver.m
% Author:   Samuel Acuña
% Date:     18 Dec 2018
%
% Project idea: create a video game
% Premise: knights fight each other
%
% Example 2: matlab class with static methods
%
% Description:
% check if the game is over
isOver = 0;
if isDead(knight2)
    disp([knight2.name ' died.'])
    disp([knight1.name ' is the winner!']);
    disp(['Game over.']);
    isOver = 1;
elseif isDead(knight1)
    disp([knight1.name ' died.'])
    disp([knight2.name ' is the winner!']);
    disp(['Game over.']);
    isOver = 1;
end
end