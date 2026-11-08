// --- STEP DO PLAYER 
depth = -y;

// Verifica se tem fôlego pra correr
if (folego <= 0) pode_correr = false;
if (folego >= 30) pode_correr = true; // Só deixa voltar a correr quando recuperar um pouco

estado_agachado = keyboard_check(vk_control);
estado_correndo = keyboard_check(vk_shift) && pode_correr; // Só corre se a variável deixar

// Verifica se o player tá realmente se movendo pra gastar fôlego
var _movendo = (velh != 0 || velv != 0);

if (estado_agachado) {
    vel = vel_agachado;
} else if (estado_correndo && _movendo) {
    vel = vel_correndo;
    folego -= 1; // Drena o fôlego rápido enquanto corre
} else {
    vel = vel_normal;
    // Recupera fôlego quando tá andando normal ou parado
    if (folego < folego_max) {
        folego += 0.5; 
    }
}

// Daqui pra baixo continua igualzinho você já tem (Entrada do jogador, _dir_x, etc...)

// Entradas do jogador
var _direita = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _esquerda = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _baixo = keyboard_check(vk_down) || keyboard_check(ord("S"));
var _cima = keyboard_check(vk_up) || keyboard_check(ord("W"));

var _dir_x = _direita - _esquerda;
var _dir_y = _baixo - _cima;

// Normaliza o movimento diagonal
if (_dir_x != 0 || _dir_y != 0) {
    var _tamanho = point_distance(0, 0, _dir_x, _dir_y);
    _dir_x /= _tamanho;
    _dir_y /= _tamanho;
}

velh = _dir_x * vel;
velv = _dir_y * vel;

// Colisão Horizontal
if (!place_meeting(x + velh, y, obj_paredes)) {
    x += velh;
} else if (velh != 0) {
    while (!place_meeting(x + sign(velh), y, obj_paredes)) {
        x += sign(velh);
    }
    velh = 0;
}

// Colisão Vertical
if (!place_meeting(x, y + velv, obj_paredes)) {
    y += velv;
} else if (velv != 0) {
    while (!place_meeting(x, y + sign(velv), obj_paredes)) {
        y += sign(velv);
    }
    velv = 0;
}

// ANIMAÇÃO UNIFICADA 
if (velh != 0 || velv != 0) {
    image_speed = 1; 

    // Define o sprite correto enquanto anda
    if (estado_agachado) {
        sprite_index = spr_player_agachado;
    } else {
        if (_cima) {
            sprite_index = spr_player_tras;
        } else {
            sprite_index = spr_player;
        }
    }

    // Vira pra esquerda ou direita
    if (_dir_x != 0) {
        image_xscale = sign(_dir_x);
    }
    
} else {
    // Quando tá parado
    image_speed = 0;
    image_index = 0; 
    
    if (estado_agachado) {
        sprite_index = spr_player_agachado;
    } else {
        // Se soltar o movimento enquanto estava de costas, continua de costas.
        // Se não estava de costas, garante que fica de frente.
        if (sprite_index != spr_player_tras) {
            sprite_index = spr_player;
        }
    }
}


// Procura qual é o interagível MAIS PRÓXIMO do jogador
var _objeto_perto = instance_nearest(x, y, obj_interagivel);

// Verifica se achou algum e se a distância dele é menor ou igual a 32 pixels
if (_objeto_perto != noone && distance_to_object(_objeto_perto) <= 32) {
    
    // Agora só interage com o que estiver realmente mais perto
    if (keyboard_check(ord("E"))) {
        _objeto_perto.interagiu = true;
        vel = 0; // Trava o player no lugar
    }
}