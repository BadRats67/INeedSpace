/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

event_inherited(); 
tempo_necessario = game_get_speed(gamespeed_fps) * 2; // 2 segundos segurando

acao_concluida = function() {
    var _ctrl = instance_find(obj_game_controller, 0);
    
    if (_ctrl != noone) {
        // O alarme só avança a missão se o progresso atual for o 0 (Desligar Alarme)
        if (_ctrl.missao_progresso == 0) {
            _ctrl.missao_progresso = 1; // Manda o jogo ir pra missão 1 (Higiene)
            show_message("Alarme desligado. Que barulho insuportavel.");
        } else {
            show_message("O alarme ja esta desligado.");
        }
    }
};