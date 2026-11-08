/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

event_inherited(); 

tempo_necessario = game_get_speed(gamespeed_fps) * 10; // 10 segundos esperando o café

acao_concluida = function() {
    var _ctrl = instance_find(obj_game_controller, 0);
    
    if (_ctrl != noone) {
        if (_ctrl.missao_progresso == 2) {
            _ctrl.missao_progresso = 3; // Avança pro oxigênio
            show_message("Cafe pronto. O gosto ta horrivel como sempre.");
        } else if (_ctrl.missao_progresso < 2) {
            show_message("Tenho outras coisas pra fazer antes do cafe.");
        } else {
            show_message("Nao quero mais cafe hoje.");
        }
    }
};