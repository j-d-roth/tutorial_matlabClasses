classdef knight
    % Filename: knight.m
    % Author:   Samuel Acuña
    % Date:     18 Dec 2018
    %
    % Project idea: create a video game
    % Premise: knights fight each other
    %
    % Example 4: matlab objected oriented programming
    %
    properties(GetAccess = 'public', SetAccess = 'private')
        % public read access, but private write access.
        
        name; % name of the knight
        health; % current health
        base_health; % starting level of health
        weapon; % weapon equipped
        armour; % armour equipped
        
        % combat properties:
        combatAbility;
        odds_of_missing;
        odds_of_blocking;
        odds_of_criticalHit;
    end
    
    properties (Dependent)
        attack; % current attack power of this knight
        block; % current blocking power of this knight
        isDead; % has this knight died?
        missedAttack; % did this knight miss their attack?
        blockedAttack; % did this knight block the oncoming attack?
        criticalHitAttack; % did this knight land a critical hit?
    end
    
    methods 
        function obj = knight(name)
            % CONSTRUCTOR FUNCTION. Goal: instantiate the undefined
            % properties. If user doesnt specify when constructing this
            % object, provide default values.
            
            obj.name = name;
            
            % random starting properties
            obj.base_health = randi(30)+70; 
            obj.health = obj.base_health;
            obj.weapon = weapon();
            obj.armour = armour();
            obj = obj.setCombatAbility(randi(4));
            
            disp(['You created a knight named ' obj.name '.']);
        end
        function obj = setCombatAbility(obj,value)
            % set combat ability (1-4)
            switch value
                case 1
                    obj.combatAbility = 'novice';
                    obj.odds_of_missing = 0.35;
                    obj.odds_of_blocking = 0.1;
                    obj.odds_of_criticalHit = 0.05;
                case 2
                    obj.combatAbility = 'trained';
                    obj.odds_of_missing = 0.2;
                    obj.odds_of_blocking = 0.2;
                    obj.odds_of_criticalHit = 0.1;
                case 3
                    obj.combatAbility = 'warrior';
                    obj.odds_of_missing = 0.1;
                    obj.odds_of_blocking = 0.4;
                    obj.odds_of_criticalHit = 0.2;
                case 4
                    obj.combatAbility = 'legendary';
                    obj.odds_of_missing = 0.05;
                    obj.odds_of_blocking = 0.5;
                    obj.odds_of_criticalHit = 0.3;
            end
        end
        function obj = sharpenWeapon(obj)
            obj.weapon = obj.weapon.sharpen();
            disp(' ')
            disp([obj.name ' sharpened their ' obj.weapon.type ', and increased its attack by 50% for 5 hits']);
        end
        function obj = landsHit(obj)
            obj.weapon = obj.weapon.hit();
        end
        function a = get.attack(obj)
            a = obj.weapon.attack;
        end
        function b = get.block(obj)
            b = obj.armour.block;
        end
        function TF = get.isDead(obj)
            if obj.health <=0
                TF = true;
            else
                TF = false;
            end
        end
        function TF = get.missedAttack(obj)
            % check if attack misses
            TF = false; % default
            
            % "missing" logic:
            attack_chance = rand(1);
            if attack_chance < obj.odds_of_missing
                % knight's attack misses
                TF = true;
            end
        end
        function TF = get.blockedAttack(obj)
            % check if attack is blocked
            TF = false; % default
            
            % blocking logic:
            block_chance = rand(1);
            if block_chance <= obj.odds_of_blocking
                    % knight blocks attack 
                    TF = true;
            end
        end
        function TF = get.criticalHitAttack(obj)
            % check if attack is a critical
            TF = false; % default
            
            % critical hit logic:
            criticalHit_chance = rand(1);
            if criticalHit_chance <= obj.odds_of_criticalHit
                    % knight1 lands a critical hit
                    TF = true;
            end
        end
    end %methods
end %classdef