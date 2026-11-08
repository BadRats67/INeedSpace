/// @description Inserir descrição aqui
//to atualizando isso ainda, se mexer me avisem

depth = -y

//step
//teclas
up = keyboard_check(vk_up) or keyboard_check(ord("W"));
down = keyboard_check(vk_down) or keyboard_check(ord("S"));
right = keyboard_check(vk_right) or keyboard_check(ord("D"));
left = keyboard_check(vk_left) or keyboard_check(ord("A"));

//andar, nem eu sei fazer esse calculo, não mexer
if ((right xor left) or (up xor down)) {
    var _dir = point_direction(0, 0, right - left, down - up);
    velh = lengthdir_x(vel, _dir);
    velv = lengthdir_y(vel, _dir);
    
    // Roda a animação nos 16 FPS definidos no sprite
    image_speed = 1; 
} else {
    // Senão não estou apertando nenhuma tecla
    velh = 0;
    velv = 0;
    
    // Para a animação no primeiro frame quando parado
    image_speed = 0;
    image_index = 0;
}
if keyboard_check_pressed(ord("C")){

	sprite_index = spr_player_agachado
} else{

sprite_index = spr_player;
}

//virar pro lado certo
if (right == true){
    image_xscale = +2
}

if (left == true){
    image_xscale = -2
}

//andar em si
x += velh;
y += velv;


//interações
var _instancia_objeto = instance_place(x, y, obj_interagivel);

if (_instancia_objeto != noone) { 
	
    if keyboard_check_pressed(ord("E")) { 
        // Avisa a esse objeto específico para rodar o código de interação dele
        with(_instancia_objeto) {
            interagiu = true; // Ativa uma variável dentro do objeto
            // OU
            // event_user(0); // Roda o Evento de Usuário 0 do objeto
        }
    } 
}
