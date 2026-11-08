var _ctrl = instance_find(obj_game_controller, 0);

if (_ctrl != noone) {
    
    // HUD OCULTA: Segure TAB para ver
    if (keyboard_check(vk_tab)) {
        
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_set_font(fnt_padrao); 

        // 1. ÍCONE DO DIA
        var _frame_dia = max(0, _ctrl.dia_atual - 1);
        draw_sprite(spr_icons_dias, _frame_dia, 5, 5); 

        // 2. DESCOBRINDO A SALA ATUAL (Para o Mapa e pro Ícone do Local)
        var _frame_sala = 0;
        
        switch (room) {
            case rm_centrodesuporteavida: _frame_sala = 0; break;
            case rm_saladecontrole:       _frame_sala = 1; break;
            case rm_quarto:               _frame_sala = 2; break;
            case rm_objervatorio:         _frame_sala = 3; break; 
            case rm_banheiro:             _frame_sala = 4; break;
            case rm_enfermagem:           _frame_sala = 5; break;
            case rm_cozinha:              _frame_sala = 6; break;
            case rm_laboratorio:          _frame_sala = 7; break;
            case rm_corredor:             _frame_sala = 8; break;
        }

        // Desenha o ícone do local e o mapa baseados na mesma sala!
        // Se a ordem das imagens do spr_icons_local for a mesma do mapa, 
        // a gente já mata dois coelhos numa cajadada só.
        draw_sprite(spr_icons_local, _frame_sala, 150, 5); 
        draw_sprite(spr_icons_mapa, _frame_sala, 260, 5); 

        // 3. BARRA DE SANIDADE (Tamanho exato)
        var _x_sanidade = 5;
        var _y_sanidade = 25; 

        var _largura_max = 20; 
        var _largura_tinta = _largura_max * (_ctrl.sanidade / 100);

        if (_ctrl.sanidade > 60) {
            draw_set_color(c_lime);
        } else if (_ctrl.sanidade > 30) {
            draw_set_color(c_orange);
        } else {
            draw_set_color(c_red);
        }

        if (_largura_tinta > 0) {
            draw_rectangle(_x_sanidade + 1, _y_sanidade + 1, _x_sanidade + 1 + _largura_tinta, _y_sanidade + 4, false);
        }

        draw_sprite(spr_icons_sanidade, 0, _x_sanidade, _y_sanidade);

        // 4. TEXTOS 
        draw_set_color(c_white);
        draw_text(5, 170, "HORA: " + string(_ctrl.hora_atual) + ":00");
        draw_text(5, 185, string(_ctrl.missao_texto));
    }
}