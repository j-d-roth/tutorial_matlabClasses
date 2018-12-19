function knight2 = fight(knight1,knight2)
% Filename: fight.m
% Author:   Samuel Acuña
% Date:     18 Dec 2018
%
% Project idea: create a video game
% Premise: knights fight each other
%
% Example 2: matlab class with static methods
%
% Description:
% knight1 attacks knight2

disp(' ');

% check if game over
if checkGameOver(knight1,knight2)
    return
end

% attack attempted:
disp([knight1.name ' attacks ' knight2.name ' with ' knight1.weapon '.']);

% fight logic:
if ~missed(knight1) % if attack doesn't miss
    if ~blocked(knight2) % if not blocked
        % knight 1 successfully attacks
        
        % check for critical hit
        attack_modifier = 1;
        if criticalHit()
            attack_modifier = 1.5;
        end
        
        % decrement knight2 health
        knight2.health = knight2.health - attack_modifier*knight1.attack;
        disp([knight1.name ' does ' num2str(attack_modifier*knight1.attack) ' damage.']);
        
        % check if game over
        checkGameOver(knight1,knight2);
    end
end
end