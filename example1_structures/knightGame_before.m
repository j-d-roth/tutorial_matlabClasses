% Filename: knightGame_before.m
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
knight1_health = 50;
knight1_attack = 5;
knight1_weapon = 'sword';
knight1_armour = 'helmet';

knight2_health = 60;
knight2_attack = 7;
knight2_weapon = 'spear';
knight2_armour = 'shield';


%% simulate fight

% knight1 attacks knight2
knight2_health = knight2_health - knight1_attack

% knight2 attacks knight1
knight1_health = knight1_health - knight2_attack

% repeat on and on
