function TF = isDead(knight)
% Filename: isDead.m
% Author:   Samuel Acuña
% Date:     18 Dec 2018
%
% Project idea: create a video game
% Premise: knights fight each other
%
% Example 2: matlab class with static methods
%
% Description:
% checks if knight is dead

if knight.health <= 0
    TF = true;
else
    TF = false;
end
end