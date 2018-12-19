classdef weapon
    % Filename: weapon.m
    % Author:   Samuel Acuña
    % Date:     18 Dec 2018
    %
    % Project idea: create a video game
    % Premise: knights fight each other
    %
    % Example 4: matlab objected oriented programming
    %
    
    properties (GetAccess = 'public', SetAccess = 'private')
        % public read access, but private write access.
        type; % type of weapon
        attack; % current attack of weapon
        base_attack; % base attack of weapon
        criticalHitModifier; % how attack will change with a critical hit
       % sharpen_countdown; % timer for sharpening bonus
    end
    
    methods 
        function obj = weapon(typeNum)
            % CONSTRUCTOR FUNCTION. Goal: instantiate the undefined
            % properties. If user doesnt specify when constructing this
            % object, provide default values.
            % set the weapon type from a discrete set of options
            if nargin == 0
                typeNum = randi(5); %randomly choose weapon
            end
            
            % select weapon type
            switch typeNum
                case 1
                    obj.type = 'sword';
                    obj.base_attack = 5;
                    obj.criticalHitModifier = 1.25;
                case 2
                    obj.type = 'spear';
                    obj.base_attack = 6;
                    obj.criticalHitModifier = 1.1;
                case 3
                    obj.type = 'mace';
                    obj.base_attack = 4;
                    obj.criticalHitModifier = 2.5;
                case 4
                    obj.type = 'lance';
                    obj.base_attack = 6;
                    obj.criticalHitModifier = 1.25;
                case 5
                    obj.type = 'rubber chicken';
                    obj.base_attack = 1;
                    obj.criticalHitModifier = 20.00;
                otherwise
                    error('Weapon type number must be between 1 and 5')
            end
            
            % instantiate other properties with defaults
            obj.attack = obj.base_attack;
            obj.sharpen_countdown = 0;
        end
%         function obj = sharpen(obj)
%             % sharpen your weapon for temporary bonus. lasts 5 attacks
%             obj.attack = 1.5*obj.attack;
%             obj.sharpen_countdown = 5;
%         end
        function [obj, hit_attack_val] = hit(obj,yesCriticalHit)
            % set hit value from attack
            if nargin == 1
                yesCriticalHit = 0;
            end
            
            % see if critical hit
            if yesCriticalHit
                hit_attack_val = obj.attack*obj.criticalHitModifier;
            else
                hit_attack_val = obj.attack;
            end
            
            % countdown sharpening bonus
            if obj.sharpen_countdown > 0 
                obj.sharpen_countdown = obj.sharpen_countdown - 1;
                if obj.sharpen_countdown == 0 % reset attack bonus
                    obj.attack = obj.base_attack;
                    disp(['Your ' obj.type ' has lost its sharp edge.']);
                end
            end 
        end
    end %methods
end