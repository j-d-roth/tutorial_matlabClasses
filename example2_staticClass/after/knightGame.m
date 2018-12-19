classdef knightGame
    % Filename: knightGame.m
    % Author:   Samuel Acuña
    % Date:     18 Dec 2018
    %
    % Project idea: create a video game
    % Premise: knights fight each other
    %
    % Example 2: matlab class with static methods
    %
    
    methods (Static)
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
            
            % constants:
            odds_of_missing = 0.15;
            
            % missing logic:
            attack_chance = rand(1);
            if attack_chance < odds_of_missing
                % knight1's attack misses
                disp([knight1.name ' missed!']);
                TF = true;
            end
        end
        function TF = blocked(knight2)
            % check if attack is blocked
            TF = false; % default
            
            % constants:
            odds_of_blocking = 0.2;
            
            % blocking logic:
            block_chance = rand(1);
            if block_chance <= odds_of_blocking
                    % knight2 blocks attack from knight1
                    disp([knight2.name ' blocked the attack with a ' knight2.armour '!']);
                    TF = true;
            end
        end
        function TF = criticalHit()
            % check if attack is a critical
            TF = false; % default
            
            % constants:
            odds_of_criticalHit = 0.1;
            
            % critical hit logic:
            criticalHit_chance = rand(1);
            if criticalHit_chance <= odds_of_criticalHit
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