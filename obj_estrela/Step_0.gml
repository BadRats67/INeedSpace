/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (position_meeting(mouse_x, mouse_y, id)) {
    image_alpha = 1.0; 
    
    if (mouse_check_button_pressed(mb_left)) {
        // Se clicar, cria a UI do diário e passa qual planeta foi clicado
        if (!instance_exists(obj_ui_planeta)) {
            var _ui = instance_create_layer(0, 0, "Instances", obj_ui_planeta);
            _ui.planeta_exibido = planeta_id;
        }
    }
} else {
    image_alpha = 0.5; 
}