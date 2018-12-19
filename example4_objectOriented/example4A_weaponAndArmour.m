% Filename: example1_weaponAndArmour.m
% Author:   Samuel Acuña
% Date:     18 Dec 2018
% 
% Project idea: create a video game
% Premise: knights fight each other
%
% Example 4: matlab objected oriented programming


clear; close all; clc;
return
%%%%%%%%%%%%%%%%%%%%%%%%
%% examine the Armour class
% this is just a basic class

a = armour() % create random armour object

%% look at properties
a.block

%% try to change properties directly
a.block = 100

%% look at properties again
a.block



%%%%%%%%%%%%%%%%%%%%%%%%
%% examine the Weapon class
% this class has class properties with attributes, and set/get functions
b = weapon() % create random weapon object

%% try to change properties
b.attack = 100

%% change weapon type (using a hidden property, but still accessible)
b.typeNum = 9
