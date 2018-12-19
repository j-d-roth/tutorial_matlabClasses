classdef knightGame < handle
    % Filename: knightGame.m
    % Author:   Samuel Acuña
    % Date:     18 Dec 2018
    %
    % Project idea: create a video game
    % Premise: knights fight each other to the death
    %
    % Example 4: matlab objected oriented programming
    %
    %%%%%%%%%%%%
    % PUBLIC PROPERTIES
    properties (GetAccess = 'public', SetAccess = 'private')
        knights;
        turn_counter;
    end
    %%%%%%%%%%%%
    % HIDDEN PROPERTIES
    properties (Dependent,Hidden)
        nKnights;
        knightsWhoAreAlive;
        gameOver;
    end
    properties (Constant,Hidden)
        % plotting properties
        figure_color = [35, 35, 35]/255; % color of figure background
        axes_color = [35, 35, 35]/255; % color of axes
        text_color =  [1, 1, 1];
        axesX_color = [1, 1, 1];
        axesY_color = [1, 1, 1];
        plot_color = [241, 90, 90;
          240, 196, 25;
          78, 186, 111;
          45, 149, 191;
          149, 91, 165]/255;
        lw = 3; % linewidth
        faceColor = [241, 90, 90]/255;
        edgeColor = [1, 1, 1];
        textColor = [1, 1, 1];
    end
    
    %%%%%%%%%%%%
    % CLASS METHODS
    methods
        %%%%%%%%%%%%
        % CONSTRUCTOR
        function obj = knightGame(names)
             % CONSTRUCTOR FUNCTION. Goal: instantiate the undefined
            % properties. If user doesnt specify when constructing this
            % object, provide default values.
            % names: cell array of names of the knights
            %    e.g. {'simon','suzy','terry'}
            
            for i = 1:length(names)
                k(i) = knight(names{i});
            end
            obj.knights = k;
            obj.turn_counter = 0;
            
        end
        
        %%%%%%%%%%%%
        % SPECIAL OBJECT METHODS
        function obj = fight(obj) % knicghts fight each other
            if obj.gameOver % check if game is over
                    obj.declareChampion();
                    return
            end
            obj.turn_counter = obj.turn_counter+1; % count turns
        
            % randomly decide who attacks first
            order = obj.knightsWhoAreAlive(randperm(length(obj.knightsWhoAreAlive))); % use only knights that are not dead
            for i = 1:length(order)
                obj = obj.attack(order(i)); % knight attacks!
                if obj.gameOver % check if game is over
                    obj.declareChampion();
                    return
                end
            end
        end
        function obj = attack(obj,currentKnight) % attacking algorithm
            % cant attack if dead
            if obj.knights(currentKnight).isDead
                return
            end
            
            % don't attack yourself
            otherKnights = obj.knightsWhoAreAlive;
            otherKnights(currentKnight) = [];
            
            % randomly attack another knight
            chosenVictim = otherKnights(randi(length(otherKnights)));
            
            disp(' ');
            disp([obj.knights(currentKnight).name ' attacks ' obj.knights(chosenVictim).name ' with a ' obj.knights(currentKnight).weapon.type '.']);
            
             % fight logic:
             if ~obj.knights(currentKnight).missedAttack % if attack doesn't miss
                 if ~obj.knights(chosenVictim).blockedAttack % if not blocked
                     % knight successfully attacks
                     obj.knights(currentKnight) = obj.knights(currentKnight).landsHit();
                     if obj.knights(currentKnight).criticalHitAttack % is it a critical hit?
                         disp(['It is a critical hit!']);
                         damage = obj.knights(currentKnight).attack_critical;
                     else
                         damage = obj.knights(currentKnight).attack;
                     end
                     disp([obj.knights(currentKnight).name ' does ' num2str(damage) ' damage.']);
                     obj.knights(chosenVictim) = obj.knights(chosenVictim).getsHit(damage);
                 else
                     disp([obj.knights(chosenVictim).name ' blocked the attack with their ' obj.knights(chosenVictim).armour.type '!']);
                 end
             else
                   disp([obj.knights(currentKnight).name ' missed!']);
             end
        end

        %%%%%%%%%%%%
        % OTHER OBJECT METHODS
        function status(obj) % displays health stats of knights
            disp(' ');
            for i = 1:obj.nKnights
                disp(['   ' obj.knights(i).getHealth]);
            end
        end
        function plotStatus(obj) % plot knight health stats
             % setup figure
            fig = figure(1); clf; ax = axes;
            
            % get data
            healthData = zeros(1,obj.nKnights);
            baseHealthData = zeros(1,obj.nKnights);
            names = cell(1,obj.nKnights);
            for i = 1:obj.nKnights
                healthData(i) = obj.knights(i).health;
                baseHealthData(i) = obj.knights(i).base_health;
                names{i} = obj.knights(i).name;
            end
            
            % plot health status
            h = barh([1:obj.nKnights],baseHealthData);
            h.FaceColor = obj.plot_color(4,:);
            hold on
            h2 = barh([1:obj.nKnights],healthData);
            h2.FaceColor = obj.plot_color(1,:);
            hold off
            yticklabels(names)
            xlim([0, 1.2*max(baseHealthData)]);
            title('Knight Health','Color', obj.text_color);
            legend('Max Health', 'Current Health');
            
            % display weapons & armor
            shift = 0.1;
            for i = 1:obj.nKnights
                text(1+25,i,['Combat Ability: ' obj.knights(i).combatAbility]);
                text(1,i+shift,['Hits Landed: ' num2str(obj.knights(i).nHitsLanded)]);
                text(1,i-shift,['Hits Recieved: ' num2str(obj.knights(i).nHitsRecieved)]);
            end
            
            % figure properties
            fig.Color = obj.figure_color;
            ax.Color = obj.axes_color;
            ax.XColor = obj.axesX_color;
            ax.YColor = obj.axesY_color; 
        end
        function plotAttack(obj) % plot knight attack stats
            % setup figure
            fig = figure(2); clf; ax = axes;
            
            % get data
            blockData = zeros(1,obj.nKnights);
            criticalAttackData = zeros(1,obj.nKnights);
            names = cell(1,obj.nKnights);
            for i = 1:obj.nKnights
                blockData(i) = obj.knights(i).attack;
                criticalAttackData(i) = obj.knights(i).attack_critical;
                names{i} = obj.knights(i).name;
            end
            
            % plot attack amounts
            h = barh([1:obj.nKnights],criticalAttackData);
            h.FaceColor = obj.plot_color(1,:);
            hold on
            h2 = barh([1:obj.nKnights],blockData);
            h2.FaceColor = obj.plot_color(2,:);
            hold off
            yticklabels(names);
            xlim([0, 1.2*max(criticalAttackData)]);
            title('Knight Attack Strength','Color', obj.text_color);
            legend('Max Attack', 'Normal Attack');
            
            % display weapons & armor
            shift = 0.1;
            for i = 1:obj.nKnights
                text(1,i+shift,['Weapon: ' obj.knights(i).weapon.type]);
                text(1,i-shift,['Armour: ' obj.knights(i).armour.type]);
            end
            
            % figure properties
            fig.Color = obj.figure_color;
            ax.Color = obj.axes_color;
            ax.XColor = obj.axesX_color;
            ax.YColor = obj.axesY_color;
        end
        
        %%%%%%%%%%%%
        % GET FUNCTIONS
        function n = get.nKnights(obj)
            n = length(obj.knights);
        end
        function roster = get.knightsWhoAreAlive(obj)
            roster = [];
            for i = 1:obj.nKnights
                if ~obj.knights(i).isDead
                    roster = [roster i];
                end
            end
        end
        function TF = get.gameOver(obj)
            % check to see if the game is over
            TF = false;
            if length(obj.knightsWhoAreAlive) == 1
                TF = true;
            end
        end
    end %methods
    methods (Access = 'private')
        function declareChampion(obj) % declare champion at the end of the game
            disp(' ');
            disp([ obj.knights(obj.knightsWhoAreAlive).name ' is the champion!']);
            disp([' Turns taken: ' num2str(obj.turn_counter)]);
            disp(' Game Over.');
        end
    end
end %classdef