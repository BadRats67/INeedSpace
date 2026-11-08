/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// --- CREATE DO OBJ_PAINEL_OXIGENIO ---
event_inherited(); 

missao_alvo = 3; // Essa é a variável que diz que esse painel é o dono da missão 3
tempo_necessario = game_get_speed(gamespeed_fps) * 4; // 4 segundos checando

// Aqui a gente "reescreve" a ação padrão para ela avançar a missão no Controlador
acao_concluida = function() {
    var _ctrl = instance_find(obj_game_controller, 0);
    
    if (_ctrl != noone) {
        // Verifica se o jogador realmente está na missão 3 (Oxigênio)
        if (_ctrl.missao_progresso == 3) {
            _ctrl.missao_progresso = 4; // AVANÇA A MISSÃO AQUI!
            show_message("Niveis de oxigenio estaveis... por enquanto.");
        } else if (_ctrl.missao_progresso < 3) {
            show_message("Tenho que terminar minha rotina antes de checar isso.");
        } else {
            show_message("O oxigenio ja foi verificado hoje.");
        }
    }
};