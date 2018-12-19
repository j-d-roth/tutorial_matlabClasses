% Filename: knightGame.m
% Author:   Samuel Acuña
% Date:     18 Dec 2018
% 
% Project idea: create a video game
% Premise: knights fight each other
%
% Example 2: matlab class with static methods
%

clear; close all; clc;

%%%%%%%%%%%%%%
%% Create the characters.
k1.name = 'Simon';
k1.health = 50;
k1.attack = 5;
k1.weapon = 'sword';

k2.name = 'Suzy';
k2.health = 60;
k2.attack = 7;
k2.weapon = 'spear';
return

%%%%%%%%%%%%%%
%% show knights stats
k1
k2

%%%%%%%%%%%%%%
%% simulate fight actions
k1 = getsHit(k1,5); % what happens if you remove the "k1 = " from the front?
%%
k1 = getsHit(k1,k2.attack);
%%
k2 = getsHit(k2,k1.attack);
%%
k1 = flexes(k1);
%%
k1 = roars(k1);
%%
k2 = showsOff(k2);
%%
k1 = talksSmack(k1);
%%
isDead(k1)



