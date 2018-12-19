% Filename: knightGame_after.m
% Author:   Samuel Acuña
% Date:     18 Dec 2018
% 
% Project idea: create a video game
% Premise: knights fight each other
%
% Example 1: matlab structures
%

clear; close all; clc;

%% Create the characters.
knight1.health = 50;
knight1.attack = 5;
knight1.weapon = 'sword';

knight2.health = 60;
knight2.attack = 7;
knight2.weapon = 'spear';

%% simulate fight

% knight1 attacks knight2
knight2.health = knight2.health - knight1.attack

% knight2 attacks knight1
knight1.health = knight1.health - knight2.attack

% repeat on and on
