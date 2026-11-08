/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
image_alpha = 0;

event_inherited(); 

missao_alvo = 3; // Coloque o número da missão de olhar os astros
tempo_necessario = game_get_speed(gamespeed_fps) * 4; 

acao_concluida = function() {
    var _ctrl = instance_find(obj_game_controller, 0);
    
    if (_ctrl != noone) {
        if (_ctrl.missao_progresso == missao_alvo) {
            // Em vez de só pular a missão, joga o cara pro espaço
            room_goto(rm_space);
        } else {
            show_message("Nao tenho tempo pra olhar as estrelas agora.");
        }
    }
};