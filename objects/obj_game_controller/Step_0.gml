/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Step
// Avança o relógio. O horário para em 20:00.
tempo_relogio++;

if (tempo_relogio >= frames_por_minuto) {
    tempo_relogio = 0;

    if (hora_atual < 20) {
        hora_atual++;
    }
}

// Perda gradual de sanidade a partir do Dia 3.
if (dia_atual >= 3) {
    tempo_sanidade++;

    if (tempo_sanidade >= game_get_speed(gamespeed_fps)) {
        tempo_sanidade = 0;
        sanidade = max(0, sanidade - 0.05);
    }
}

sanidade = clamp(sanidade, 0, 100);
// --- STEP DO OBJ_GAME_CONTROLLER (Parte de Missões) ---

// Se já deu 20:00 e o jogador não estava na missão de dormir, força ele a ir dormir.
if (hora_atual >= 20 && missao_progresso < 5) {
    missao_progresso = 5; 
}

// Ciclo padrão dos primeiros dias (Rotina)
if (dia_atual <= 3) {
    switch (missao_progresso) {
        case 0: 
            missao_texto = "Objetivo: Desligar o alarme na sala de controle."; 
            break;
        case 1: 
            missao_texto = "Objetivo: Fazer higiene no banheiro."; 
            break;
        case 2: 
            missao_texto = "Objetivo: Tomar cafe na cozinha."; 
            break;
        case 3: 
            missao_texto = "Objetivo: Checar oxigenio na sala de controle."; 
            break;
        case 4: 
            // No dia 2 e 3 tem descontaminação. No dia 1, é tempo livre.
            if (dia_atual >= 2) {
                missao_texto = "Objetivo: Descontaminacao.";
            } else {
                missao_texto = "Tempo livre. Aguarde as 20:00.";
            }
            break;
        case 5: 
            missao_texto = "Comando da Terra: Encerre o turno e va dormir."; 
            break;
    }
} 
// Para os dias mais insanos (4 ao 6) a gente pode colocar mais missões  depois
else if (dia_atual < 7) {
    missao_texto = "A nave esta estranha... Explore e tente consertar.";
} 
// Dia 7 (Final)
else {
    missao_texto = "PRECISO DE ESPACO. PRECISO DE ESPACO.";
}