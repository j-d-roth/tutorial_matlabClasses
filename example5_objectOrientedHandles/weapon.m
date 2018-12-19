classdef weapon < handle
    % Filename: weapon.m
    % Author:   Samuel Acuña
    % Date:     18 Dec 2018
    %
    % Project idea: create a video game
    % Premise: knights fight each other
    %
    % Example 4: matlab objected oriented programming
    %
    % examples of constraints on properties, and set/get methods
    %
    % for more on property attributes, see:
    % https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html
    
    %%%%%%%%%%%%
    % PUBLIC PROPERTIES
    properties (Dependent, SetAccess = 'private')
        type; % type of weapon
        attack; % damage weapon inflicts
        attack_critical; % how much damage does a critical hit do?
    end
    
    %%%%%%%%%%%%
    % HIDDEN PROPERTIES
    properties (Hidden)
       typeNum;  % index of which weapon the object is
    end
    properties (Constant, Hidden)
        % library of all possible weapons
        possibleWeapons = struct('type',{'sword','spear','mace','lance','rubber chicken'},...
                                 'attack',{5,6,4,6,1},...
                                 'criticalHitModifier',{1.25,1.1,2.5,1.25,20.00});
    end
    
    %%%%%%%%%%%%
    % CLASS METHODS
    methods 
        %%%%%%%%%%%%
        % CONSTRUCTOR
        function obj = weapon(typeNum)
            % CONSTRUCTOR FUNCTION. Goal: instantiate the undefined
            % properties. If user doesnt specify when constructing this
            % object, provide default values.
            % set the weapon type from a discrete set of options
            if nargin == 0
                nPossibleWeapons = length(obj.possibleWeapons);
                typeNum = randi(nPossibleWeapons); %randomly choose weapon
            end
            obj.typeNum = typeNum; % note: redirects to set function
        end
        
        %%%%%%%%%%%%
        % SET FUNCTIONS
        function set.typeNum(obj,typeNum)
            % sets weapon index, but checks that number is valid first
            nPossibleWeapons = length(obj.possibleWeapons); % could also be "weapon.possibleWeapons" since it is a constant property
            if typeNum > nPossibleWeapons
                error(['Weapon type number must be between 1 and ' num2str(nPossibleWeapons)])
            end
            obj.typeNum = typeNum; % set weapon type index
        end
        
        %%%%%%%%%%%%
        % GET FUNCTIONS
        function t = get.type(obj)
            % displays the type of weapon
            t = weapon.possibleWeapons(obj.typeNum).type;
        end
        function a = get.attack(obj)
            % displays the attack value of weapon
            a = weapon.possibleWeapons(obj.typeNum).attack;
        end
        function ac = get.attack_critical(obj)
            % displays the how much damage a critical hit would give
            criticalHitModifier = weapon.possibleWeapons(obj.typeNum).criticalHitModifier;
            ac = criticalHitModifier*obj.attack;
        end
    end %methods
end