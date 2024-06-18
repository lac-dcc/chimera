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
    enter,
    clock,
    reset);

// Inicializar entradas y salidas
output reg asensor, lsensor, enter, clock, reset;
output reg [7:0] password;
input wire p_alarm, b_alarm, gate_open, gate_close, gate_block;

always begin
    #7.5 clock = !clock;
end

initial begin
    // Valores iniciales
    password = 8'b00000000;
    asensor = 0;
    lsensor = 0;
    enter = 0;
    clock = 0;
    reset = 0;
    #1 reset = 1;
    #10 reset = 0;
    // Prueba 1
    #100 asensor = 1;
    #50 password = 8'b00101010;
    enter = 1;
    #15 enter = 0;
    #50 asensor = 0;
    password = 8'b00000000;
    #50 lsensor = 1;
    #100 lsensor = 0;

    // Prueba 2
    #200 asensor = 1;
    #50 password = 8'b00101110;
    enter = 1;
    #15 enter = 0;
    #50 password = 8'b10101010;
    enter = 1;
    #15 enter = 0;
    #50 password = 8'b00101010;
    enter = 1;
    #15 enter = 0;
    #50 asensor = 0;
    password = 8'b00000000;
    #50 lsensor = 1;
    #100 lsensor = 0;

    // Prueba 3
    #200 asensor = 1;
    #50 password = 8'b00101110;
    enter = 1;
    #15 enter = 0;
    #50 password = 8'b00101110;
    enter = 1;
    #15 enter = 0;
    #50 password = 8'b00101110;
    enter = 1;
    #15 enter = 0;
    #50 password = 8'b10101010;
    enter = 1;
    #15 enter = 0;
    #50 password = 8'b00101010;
    enter = 1;
    #15 enter = 0;
    #50 asensor = 0;
    password = 8'b00000000;
    #50 lsensor = 1;
    #100 lsensor = 0;
    
    // Prueba 4
    #200 asensor = 1;
    #100 lsensor = 1;
    #100 asensor = 0;
    #100 lsensor = 0;
    #50 password = 8'b00000001;
    enter = 1;
    #15 enter = 0;
    #100 password = 8'b00101010;
    enter = 1;
    #15 enter = 0;
    #50 password = 8'b00000000;
    #100 asensor = 1;
    #50 password = 8'b00101010;
    enter = 1;
    #15 enter = 0;
    #50 asensor = 0;
    #50 lsensor = 1;
    #100 lsensor = 0;

    // Terminar simulacion
    #100 $finish;
end

endmodule
