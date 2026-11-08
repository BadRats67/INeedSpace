/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// STEP
depth = -y;
var _player = instance_find(obj_player, 0);

// Cancela se afastar
if (_player == noone || distance_to_object(_player) > 32) {
    interagiu = false;
    tempo_interacao = 0;
}

if (interagiu) {
    // Se soltar o E antes de acabar, reseta
    if (!keyboard_check(ord("E"))) {
        interagiu = false;
        tempo_interacao = 0;
    } else {
        tempo_interacao++;

        if (tempo_interacao >= tempo_necessario) {
            tempo_interacao = 0;
            interagiu = false;
            acao_concluida();
        }
    }
}