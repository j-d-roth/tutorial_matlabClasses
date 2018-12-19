% Filename: knightGame_driver.m
% Author:   Samuel Acuña
% Date:     18 Dec 2018
% 
% Project idea: create a video game
% Premise: knights fight each other
%
% Example 3: matlab class with static methods
%

clear; close all; clc;

%% Create the characters.
knight1.name = 'Simon';
knight1.health = 50;
knight1.attack = 5;
knight1.weapon = 'sword';
knight1.armour = 'helmet';

knight2.name = 'Suzy';
knight2.health = 60;
knight2.attack = 7;
knight2.weapon = 'spear';
knight2.armour = 'shield';


%% simulate fight

knight2 = knightGame.fight(knight1,knight2); % knight1 attacks knight2
knight1 = knightGame.fight(knight2,knight1); % knight2 attacks knight1

% repeat on and on

%% check status
knightGame.status(knight1,knight2)