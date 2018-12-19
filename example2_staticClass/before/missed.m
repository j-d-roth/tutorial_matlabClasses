function TF = missed(knight1)
% Filename: missed.m
% Author:   Samuel Acuña
% Date:     18 Dec 2018
%
% Project idea: create a video game
% Premise: knights fight each other
%
% Example 2: matlab class with static methods
%
% Description:
% check if attack misses
TF = false; % default

% constants:
odds_of_missing = 0.15;

% missing logic:
attack_chance = rand(1);
if attack_chance < odds_of_missing
    % knight1's attack misses
    disp([knight1.name ' missed!']);
    TF = true;
end
end