classdef knightGame
    % Filename: knightGame.m
    % Author:   Samuel Acuña
    % Date:     18 Dec 2018
    %
    % Project idea: create a video game
    % Premise: knights fight each other
    %
    % Example 3: matlab class with static methods and properties
    %
    properties (Constant)
        % combat properties
        odds_of_missing = 0.15;
        odds_of_blocking = 0.2;
        odds_of_criticalHit = 0.1;
        
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
    
    methods (Static) % static: doesnt need an instance of an object
        function knight2 = fight(knight1,knight2)
            % knight1 attacks knight2
            disp(' ');
            
            % check if game over
            if knightGame.checkGameOver(knight1,knight2)
                return
            end
            
            % attack attempted:
            disp([knight1.name ' attacks ' knight2.name ' with ' knight1.weapon '.']);

            % fight logic:
            if ~knightGame.missed(knight1) % if attack doesn't miss
                if ~knightGame.blocked(knight2) % if not blocked
                    % knight 1 successfully attacks
                    
                    % check for critical hit
                    attack_modifier = 1;
                    if knightGame.criticalHit()
                        attack_modifier = 1.5;
                    end
                    
                    % decrement knight2 health
                    knight2.health = knight2.health - attack_modifier*knight1.attack;
                    disp([knight1.name ' does ' num2str(attack_modifier*knight1.attack) ' damage.']);
                    
                    % check if game over
                    knightGame.checkGameOver(knight1,knight2);
                end    
            end
        end
        function TF = missed(knight1)
            % check if attack misses
            TF = false; % default
            
            % missing logic:
            attack_chance = rand(1);
            if attack_chance < knightGame.odds_of_missing
                % knight1's attack misses
                disp([knight1.name ' missed!']);
                TF = true;
            end
        end
        function TF = blocked(knight2)
            % check if attack is blocked
            TF = false; % default
            
            % blocking logic:
            block_chance = rand(1);
            if block_chance <= knightGame.odds_of_blocking
                    % knight2 blocks attack from knight1
                    disp([knight2.name ' blocked the attack with a ' knight2.armour '!']);
                    TF = true;
            end
        end
        function TF = criticalHit()
            % check if attack is a critical
            TF = false; % default
            
            % critical hit logic:
            criticalHit_chance = rand(1);
            if criticalHit_chance <= knightGame.odds_of_criticalHit
                    % knight1 lands a critical hit
                    disp(['It is a critical hit!']);
                    TF = true;
            end
        end
        function TF = isDead(knight)
            % checks if knight is dead
            if knight.health <= 0
                TF = true;
            else
                TF = false;
            end
        end
        function status(knight1,knight2)
            % displays health stats of knights
            disp(' ');
            if knightGame.isDead(knight1)
                disp(['   ' knight1.name ' is dead.']);
                disp(['   ' knight2.name ' health: ' num2str(knight2.health)]);
                disp(['   ' knight2.name ' won the fight.']);
            elseif knightGame.isDead(knight2)
                disp(['   ' knight2.name ' is dead.']);
                disp(['   ' knight1.name ' health: ' num2str(knight1.health)]);
                disp(['   ' knight1.name ' won the fight.']);
            else
                
                % show health stats
                disp(['   ' knight1.name ' health: ' num2str(knight1.health)]);
                disp(['   ' knight2.name ' health: ' num2str(knight2.health)]);
                % show who is winning
                if knight1.health > knight2.health
                    disp(['   ' knight1.name ' is winning.']);
                elseif knight2.health > knight1.health
                    disp(['   ' knight2.name ' is winning.']);
                else
                    disp(['   ' knight1.name ' is tied with ' knight2.name '.']);
                end
            end
                
        end
        function plotStatus(knight1,knight2)
             % setup figure
            fig = figure(1); ax = axes;
            
            % plot health status
            h = bar([1:2],[knight1.health, knight2.health]);
            xticklabels({knight1.name;knight2.name});
            ylim([0, 1.2*max([knight1.health, knight2.health])]);
            title('Knight Health','Color', knightGame.text_color);
            
            % figure properties
            fig.Color = knightGame.figure_color;
            ax.Color = knightGame.axes_color;
            ax.XColor = knightGame.axesX_color;
            ax.YColor = knightGame.axesY_color;
            h.FaceColor = knightGame.plot_color(1,:);
            
        end
        function plotAttack(knight1,knight2)
             % setup figure
            fig = figure(2); ax = axes;
            
            % plot health status
            h = barh([1:2],[knight1.attack, knight2.attack]);
            xlim([0, 1.2*max([knight1.attack, knight2.attack])]);
            yticklabels({knight1.name;knight2.name})
            title('Knight Attack Strength','Color', knightGame.text_color)
            
            % display weapons & armor
            text(1,1.1,['Weapon: ' knight1.weapon]);
            text(1,0.9,['Armour: ' knight1.armour]);
            text(1,2.1,['Weapon: ' knight2.weapon]);
            text(1,1.9,['Armour: ' knight2.armour]);
            
            % figure properties
            fig.Color = knightGame.figure_color;
            ax.Color = knightGame.axes_color;
            ax.XColor = knightGame.axesX_color;
            ax.YColor = knightGame.axesY_color;
            h.FaceColor = knightGame.plot_color(2,:);
            
            
        end
    end %methods
    methods (Static, Access = private)
        % insert methods that can only be accessed by this class.
        function isOver = checkGameOver(knight1,knight2)
            % check if the game is over
            isOver = 0;
            if knightGame.isDead(knight2)
                disp([knight2.name ' died.'])
                disp([knight1.name ' is the winner!']);
                disp(['Game over.']);
                isOver = 1;
            elseif knightGame.isDead(knight1)
                disp([knight1.name ' died.'])
                disp([knight2.name ' is the winner!']);
                disp(['Game over.']);
                isOver = 1;
            end
        end
    end %private methods
    
end %classdef