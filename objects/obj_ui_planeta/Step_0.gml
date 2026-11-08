/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _caixa_x = 100;
var _caixa_y = 160;

// Se o mouse clicar dentro da área do checkbox (10 pixels de margem)
if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(mouse_x, mouse_y, _caixa_x - 10, _caixa_y - 10, _caixa_x + 10, _caixa_y + 10)) {
        marcou_caixa = true;
        
        // Avança a missão e volta pra sala do observatório
        var _ctrl = instance_find(obj_game_controller, 0);
        if (_ctrl != noone) {
            _ctrl.missao_progresso++; 
        }
        
        show_message("Informacao anotada no diario.");
        room_goto(rm_objervatorio); // Volte para a sala que estava
    }
}