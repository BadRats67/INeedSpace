/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//  CREATE
interagiu = false;
tempo_interacao = 0;

tempo_necessario = game_get_speed(gamespeed_fps);
mensagem_dialogo = "Missao concluida";
missao_ID = 0;

// VALOR PADRÃO ADICIONADO AQUI:
missao_alvo = -1; 

acao_concluida = function() {
    show_message(mensagem_dialogo);
};