/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_set_font(fnt_padrao);

// Fundo escurecido pra destacar o planeta
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, 0, 300, 200, false);
draw_set_alpha(1);

// Desenha o sprite do planeta (frame = planeta_exibido)
// Supondo que a origem do sprite é no centro.
draw_sprite(spr_planetas, planeta_exibido, 150, 160);

// Texto de informação do planeta
draw_set_color(c_white);
draw_text(20, 110, info[planeta_exibido]);

// Checkbox para anotar
var _caixa_x = 100;
var _caixa_y = 160;
draw_rectangle(_caixa_x - 8, _caixa_y - 8, _caixa_x + 8, _caixa_y + 8, true); // Borda

// Desenha um "X" se marcou
if (marcou_caixa) {
    draw_line(_caixa_x - 8, _caixa_y - 8, _caixa_x + 8, _caixa_y + 8);
    draw_line(_caixa_x - 8, _caixa_y + 8, _caixa_x + 8, _caixa_y - 8);
}

draw_text(_caixa_x + 15, _caixa_y - 5, "Anotar no diario");