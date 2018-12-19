% Filename: knightGame_driver.m
% Author:   Samuel Acuña
% Date:     18 Dec 2018
% 
% Project idea: create a video game
% Premise: knights fight each other
%
% Example 4: matlab objected oriented programming
%

clear; close all; clc;
return
%% Create the characters.
names = {'Simon','Suzy','Terry'};

g = knightGame(names);
g.plotStatus()
g.plotAttack()

%% simulate fight
g = g.fight(); % what if you forget to write "g = "?
g.status();

%%
g.plotStatus()
g.plotAttack()
