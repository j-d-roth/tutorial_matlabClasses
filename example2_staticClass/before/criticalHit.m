function TF = criticalHit()
% Filename: criticalHit.m
% Author:   Samuel Acuña
% Date:     18 Dec 2018
%
% Project idea: create a video game
% Premise: knights fight each other
%
% Example 2: matlab class with static methods
%
% Description:
% check if attack is a critical
TF = false; % default

% constants:
odds_of_criticalHit = 0.1;

% critical hit logic:
criticalHit_chance = rand(1);
if criticalHit_chance <= odds_of_criticalHit
    % knight1 lands a critical hit
    disp(['It is a critical hit!']);
    TF = true;
end
end