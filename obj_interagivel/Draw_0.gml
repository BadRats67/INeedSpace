/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self(); 

var _player = instance_find(obj_player, 0);
var _ctrl = instance_find(obj_game_controller, 0);

if (_player != noone) {
    
    // O objeto checa se ELE MESMO (id) é o objeto mais próximo do player
    var _mais_proximo = instance_nearest(_player.x, _player.y, obj_interagivel);
    
    // Só desenha o E ou a barra se ele for o mais perto e estiver no raio de 32 pixels
    if (_mais_proximo == id && distance_to_object(_player) <= 32) {
        
        if (!interagiu) {
            // Desenha o E verde se for a missão, ou branco se não for
            if (_ctrl != noone && _ctrl.missao_progresso == missao_alvo) {
                draw_sprite_ext(spr_E, 0, x, bbox_top - 4, 1, 1, 0, c_lime, 1);
            } else {
                draw_sprite(spr_E, 0, x, bbox_top - 4);
            }
        } else {
            // Desenha a barra de carregamento
            var _largura = 32;
            var _altura = 4;
            var _pct = tempo_interacao / max(1, tempo_necessario);
            var _bx = x - (_largura / 2);
            var _by = bbox_top - 12;
            
            draw_set_color(c_black);
            draw_rectangle(_bx - 1, _by - 1, _bx + _largura + 1, _by + _altura + 1, false);
            draw_set_color(c_lime);
            draw_rectangle(_bx, _by, _bx + (_largura * _pct), _by + _altura, false);
        }
    }
}	