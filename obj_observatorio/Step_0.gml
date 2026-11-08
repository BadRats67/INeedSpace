/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//step
event_inherited(); 

depth = -y;

if (interagiu && tempo_interacao >= tempo_necessario - 1) {
    var _ctrl = instance_find(obj_game_controller, 0);

    if (_ctrl != noone) {
        if (room == rm_space) {
            room_goto(rm_nave_principal); 
        } else if (_ctrl.dia_atual == 1 && _ctrl.missao_progresso == 1) {
            _ctrl.missao_progresso = 2;
            show_message("A Terra parece distante. Por enquanto, tudo esta normal.");
            room_goto(rm_space);
        } else {
            show_message("Voce observa o espaco em silencio.");
        }
    }
}
