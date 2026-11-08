//step
event_inherited(); 

depth = -y;

if (interagiu && tempo_interacao >= tempo_necessario - 1) {
    var _ctrl = instance_find(obj_game_controller, 0);

    if (_ctrl != noone) {
        if (_ctrl.dia_atual == 1 && _ctrl.missao_progresso < 2) {
            show_message("Ainda tenho tarefas a fazer antes de dormir.");
            interagiu = false;
            tempo_interacao = 0;
        } else {
            if (_ctrl.dia_atual < 7) {
                _ctrl.dia_atual += 1;
                _ctrl.hora_atual = 6;
                _ctrl.tempo_relogio = 0;
                _ctrl.missao_progresso = 0;

                show_message("Voce dormiu. Dia " + string(_ctrl.dia_atual) + ".");
                room_restart();
            } else {
                show_message("Voce nao consegue mais ignorar a falta de espaco.");
                _ctrl.final_iniciado = true;
            }
        }
    }
}
