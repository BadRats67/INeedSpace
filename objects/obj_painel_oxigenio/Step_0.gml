/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//step
event_inherited(); 

depth = -y;

if (interagiu && tempo_interacao >= tempo_necessario - 1) {
    var _ctrl = instance_find(obj_game_controller, 0);

    if (_ctrl != noone) {
        if (_ctrl.dia_atual == 1) {
            if (_ctrl.missao_progresso == 0) {
                _ctrl.missao_progresso = 1;
                show_message("Painel de oxigenio: niveis normais. Proximo passo: observatorio.");
            } else {
                show_message("O painel de oxigenio ja foi verificado.");
            }
        } else if (_ctrl.dia_atual == 4) {
            _ctrl.sanidade = max(0, _ctrl.sanidade - 20);
            show_message("O painel indica 100%, mas respirar parece cada vez mais dificil.");
        } else {
            show_message("O sistema de oxigenio parece estar funcionando.");
        }
    }
}
