function status(knight1,knight2)
% Filename: status.m
% Author:   Samuel Acuña
% Date:     18 Dec 2018
%
% Project idea: create a video game
% Premise: knights fight each other
%
% Example 2: matlab class with static methods
%
% Description:
% displays health stats of knights
disp(' ');
if isDead(knight1)
    disp(['   ' knight1.name ' is dead.']);
    disp(['   ' knight2.name ' health: ' num2str(knight2.health)]);
    disp(['   ' knight2.name ' won the fight.']);
elseif isDead(knight2)
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