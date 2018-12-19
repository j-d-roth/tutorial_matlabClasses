% Filename: example2_knight.m
% Author:   Samuel Acuña
% Date:     18 Dec 2018
% 
% Project idea: create a video game
% Premise: knights fight each other to the death
%
% Example 4: matlab objected oriented programming

clear; close all; clc;
return
%% explore the knight class
k = knight('Simon')

%% look at object of objects
k.weapon
k.armour

%% simulate battle
k = k.getsHit(20); % what happens if you remove the "k = "?
k.displayHealth

