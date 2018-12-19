% Filename: example1_weaponObjects.m
% Author:   Samuel Acu�a
% Date:     18 Dec 2018
% 
% Project idea: create a video game
% Premise: knights fight each other
%
% Example 4: matlab objected oriented programming


clear; close all; clc;
return
%%%%%%%%%%%%%%%%%%%%%%%%
%% examine the weapon class
% this is just a basic class
w = weapon() % create random weapon object

%% look at properties
w

%% try to change properties directly
% we could have constraints on setting properties with (SetAccess = 'private')
w.base_attack = 100

%% try to add properties 
% we now have constraints on adding properties
w.newProperty = 5;


%%%%%%%%%%%%%%%%%%%%%%%%
%% can create an array of weapons
for i = 1:10
    w(i) = weapon();
end

