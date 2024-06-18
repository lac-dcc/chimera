// This program was cloned from: https://github.com/menesesj6/DigitalesII
// License: MIT License

/* 
MOdulos probadores para el control automatizado de compuerta

Hecho por: Jorge Meneses Garro
Fecha de entrega: 13 de Abril de 2024
*/

module Tester(
    password,
    asensor,
    lsensor,
    p_alarm,
    b_alarm,
    gate_open,
    gate_close,
    gate_block,
    enter);

// Inicializar entradas y salidas
output reg asensor, lsensor, enter;
output reg [7:0] password;
input wire p_alarm, b_alarm, gate_open, gate_close, gate_block;


initial begin
    // Valores iniciales
    password = 8'b00000000;
    asensor = 0;
    lsensor = 0;
    enter = 0;
    // Prueba 1
    #10 asensor = 1;
    #5 password = 8'b00101010;
    enter = 1;
    #1 enter = 0;
    #5 asensor = 0;
    password = 8'b00000000;
    #5 lsensor = 1;
    #10 lsensor = 0;

    // Prueba 2
    #20 asensor = 1;
    #5 password = 8'b00101110;
    enter = 1;
    #1 enter = 0;
    #5 password = 8'b10101010;
    enter = 1;
    #1 enter = 0;
    #5 password = 8'b00101010;
    enter = 1;
    #1 enter = 0;
    #5 asensor = 0;
    password = 8'b00000000;
    #5 lsensor = 1;
    #10 lsensor = 0;

    // Prueba 3
    #20 asensor = 1;
    #5 password = 8'b00101110;
    enter = 1;
    #1 enter = 0;
    #5 password = 8'b00101110;
    enter = 1;
    #1 enter = 0;
    #5 password = 8'b00101110;
    enter = 1;
    #1 enter = 0;
    #5 password = 8'b10101010;
    enter = 1;
    #1 enter = 0;
    #5 password = 8'b00101010;
    #5 asensor = 0;
    password = 8'b00000000;
    #5 lsensor = 1;
    #10 lsensor = 0;
    
    // Prueba 4
    #20 asensor = 1;
    #10 lsensor = 1;
    #10 asensor = 0;
    #10 lsensor = 0;
    #5 password = 8'b00000001;
    enter = 1;
    #1 enter = 0;
    #10 password = 8'b00101010;
    enter = 1;
    #1 enter = 0;
    #5 password = 8'b00000000;
    #10 asensor = 1;
    #5 password = 8'b00101010;
    enter = 1;
    #1 enter = 0;
    #5 asensor = 0;
    #5 lsensor = 1;
    #10 lsensor = 0;

    // Terminar simulacion
    #10 $finish;
end

endmodule
