classdef knight
    % Filename: knight.m
    % Author:   Samuel Acuña
    % Date:     18 Dec 2018
    %
    % Project idea: create a video game
    % Premise: knights fight each other to the death
    %
    % Example 4: matlab objected oriented programming
    %
    %
    % for more on property attributes, see:
    % https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html
    %
    % for more on method attributes, see:
    % https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html
    %
    
    %%%%%%%%%%%%
    % PUBLIC PROPERTIES
    properties (GetAccess = 'public', SetAccess = 'private')
        % public read access, but private write access.
        name; % name of the knight
        health; % current health
        weapon; % weapon equipped
        armour; % armour equipped
        combatAbility; % defines the odds of missing, blocking, critical hits
    end
    
    %%%%%%%%%%%%
    % HIDDEN PROPERTIES
    properties (Hidden)
        % private properties
        nHitsRecieved; % how many hits has this knight suffered?
        nHitsLanded; % how many successful hits has this knight made?
        base_health; % starting level of health
        
        % combat ability properties:
        odds_of_missing;
        odds_of_blocking;
        odds_of_criticalHit;
    end
    properties (Dependent, Hidden)
        attack; % current attack power of this knight
        attack_critical; % attack power of this knight when landing critical hits
        block; % current blocking power of this knight
        isDead; % has this knight died?
        missedAttack; % did this knight miss their attack?
        blockedAttack; % did this knight block the oncoming attack?
        criticalHitAttack; % did this knight land a critical hit?
    end
    
    %%%%%%%%%%%%
    % CLASS METHODS
    methods 
        %%%%%%%%%%%%
        % CONSTRUCTOR
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
            obj.nHitsRecieved = 0;
            obj.nHitsLanded = 0;
            obj = obj.setCombatAbility(randi(4));
            
            disp(['You created a knight named ' obj.name '.']);
        end
        %%%%%%%%%%%%
        % SPECIAL OBJECT METHODS
        function obj = getsHit(obj,damage)
            % knight was attacked and recieved damage!
            obj.nHitsRecieved = obj.nHitsRecieved +1; % update record of hits recieved
            obj.health = obj.health - damage; % damage reduces health
            if obj.isDead % check if knight died from damage
                disp(['  ' obj.name ' has died.']);
                obj.health = 0;
            end
        end
        function obj = landsHit(obj)
            % knight successfully attacked!
            obj.nHitsLanded = obj.nHitsLanded +1; % update record of hits landed
        end
        %%%%%%%%%%%%
        % SET FUNCTIONS
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
        %%%%%%%%%%%%
        % GET FUNCTIONS
        function a = get.attack(obj)
            a = obj.weapon.attack;
        end
        function a = get.attack_critical(obj)
            a = obj.weapon.attack_critical;
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
        function str = displayHealth(obj)
            % returns health statusas as string
            if obj.isDead
                str = [obj.name ' is dead.'];
            else
                str = [obj.name '''s health is ' num2str(obj.health) '/' num2str(obj.base_health) '.'];
            end
        end
    end %methods
end %classdef