/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Create
if (instance_number(obj_game_controller) > 1) {
    instance_destroy();
    exit;
}

persistent = true;

dia_atual = 1;
hora_atual = 6;
sanidade = 100;

missao_progresso = 0;
missao_texto = "";

tempo_relogio = 0;
frames_por_minuto = game_get_speed(gamespeed_fps) * 30;

tempo_sanidade = 0;
final_iniciado = false;

local_atual = 0; 

// Variáveis para controlar o teleporte entre portas
global.alvo_x = -1;
global.alvo_y = -1;