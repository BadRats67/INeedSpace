/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// --- CREATE DO OBJ_PIA ---
event_inherited(); // Puxa a inteligência do obj_interagivel

missao_alvo = 1; // Faz o ícone "E" ficar verde quando for a hora da higiene
tempo_necessario = game_get_speed(gamespeed_fps) * 5; // 5 segundos de interação

acao_concluida = function() {
    var _ctrl = instance_find(obj_game_controller, 0);
    
    if (_ctrl != noone) {
        if (_ctrl.missao_progresso == 1) {
            _ctrl.missao_progresso = 2; // Avança para a missão do café
            show_message("Rosto lavado. Ainda me sinto cansado.");
        } else if (_ctrl.missao_progresso < 1) {
            show_message("Preciso desligar aquele alarme primeiro.");
        } else {
            show_message("Ja fiz minha higiene hoje.");
        }
    }
};