classdef armour
    % Filename: weapon.m
    % Author:   Samuel Acuña
    % Date:     18 Dec 2018
    %
    % Project idea: create a video game
    % Premise: knights fight each other
    %
    % Example 4: matlab objected oriented programming
    %
    % example of a basic class
    
    properties 
        type; % type of armour
        block; % blocking ability
    end
    
    methods 
        function obj = armour(typeNum) % MUST HAVE SAME NAME AS CLASS
            % CONSTRUCTOR FUNCTION. Goal: instantiate the undefined
            % properties. If user doesnt specify when constructing this
            % object, provide default values.
            % set the armour type from a discrete set of options
            if nargin == 0
                typeNum = randi(5);
            end
            
            switch typeNum
                case 1
                    obj.type = 'shield';
                    obj.block = 25;
                case 2
                    obj.type = 'chain mail';
                    obj.block = 5;
                case 3
                    obj.type = 'breastplate';
                    obj.block = 10;
                case 4
                    obj.type = 'helmet';
                    obj.block = 8;
                case 5
                    obj.type = 'gauntlets';
                    obj.block = 3;
                otherwise
                    error('Armour type number must be between 1 and 5')
            end
        end
    end %methods
end