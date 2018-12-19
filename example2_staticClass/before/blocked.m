function TF = blocked(knight2)
% Filename: blocked.m
% Author:   Samuel Acuña
% Date:     18 Dec 2018
%
% Project idea: create a video game
% Premise: knights fight each other
%
% Example 2: matlab class with static methods
%
% Description:
% check if attack is blocked
TF = false; % default

% constants:
odds_of_blocking = 0.2;

% blocking logic:
block_chance = rand(1);
if block_chance <= odds_of_blocking
    % knight2 blocks attack from knight1
    disp([knight2.name ' blocked the attack with a ' knight2.armour '!']);
    TF = true;
end
end