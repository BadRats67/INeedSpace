/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Se a variável for diferente de -1, significa que viemos de uma porta
if (global.alvo_x != -1 && global.alvo_y != -1) {
    x = global.alvo_x;
    y = global.alvo_y;
    
    // Reseta as variáveis pra não bugar caso a sala reinicie (tipo quando vai dormir)
    global.alvo_x = -1;
    global.alvo_y = -1;
}