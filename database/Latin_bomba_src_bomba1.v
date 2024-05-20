// This program was cloned from: https://github.com/arizaga1/Latin_bomba
// License: Apache License 2.0

//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UPPuebla
// Engineer:Juan Antonio Arizaga-Silva 
// 
// Create Date: 24.01.2024 11:57:25
// Design Name: 
// Module Name: bomba1
// Project Name: Controlador de Bomba
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bomba1(
    input ck,
    input rst_i,
    input [2:0] sensores_i,
    output reg alarma_o,
    output reg bomba_o
    );
// sensores dos para el depósito superior y uno para la cisterna 

// registro para los estado
    reg [1:0] state, nextState;
   // reg alarma_r,bomba_r;
// Definición de parámetros para los estados
  parameter espera = 2'b00;
  parameter llenado = 2'b01;
  parameter alarma = 2'b10;
    

// Asignación asíncrona del siguiente estado
always @ (state) begin
    case (state)
    espera:
    if (sensores_i == 3'b000)      nextState = alarma;
    else if (sensores_i == 3'b001) nextState = llenado;
    else if (sensores_i == 3'b010) nextState = alarma;
    else if (sensores_i == 3'b011) nextState = espera;
    else if (sensores_i == 3'b100) nextState = alarma;
    else if (sensores_i == 3'b101) nextState = alarma;
    else if (sensores_i == 3'b110) nextState = alarma;
    else if (sensores_i == 3'b111) nextState = espera;
    else nextState = espera;
    llenado:
    if (sensores_i == 3'b000)      nextState = alarma;
    else if (sensores_i == 3'b001) nextState = llenado;
    else if (sensores_i == 3'b010) nextState = alarma;
    else if (sensores_i == 3'b011) nextState = llenado;
    else if (sensores_i == 3'b100) nextState = alarma;
    else if (sensores_i == 3'b101) nextState = alarma;
    else if (sensores_i == 3'b110) nextState = alarma;
    else if (sensores_i == 3'b111) nextState = espera;
    else nextState = llenado;
    alarma:
    if (sensores_i == 3'b000)      nextState = alarma;
    else if (sensores_i == 3'b001) nextState = espera;
    else if (sensores_i == 3'b010) nextState = alarma;
    else if (sensores_i == 3'b011) nextState = espera;
    else if (sensores_i == 3'b100) nextState = alarma;
    else if (sensores_i == 3'b101) nextState = alarma;
    else if (sensores_i == 3'b110) nextState = alarma;
    else if (sensores_i == 3'b111) nextState = espera;
    endcase
  end 
// Asignación síncrona: Actualización del estado
always @ (posedge ck or negedge rst_i) begin
    if (rst_i == 0) state = espera;
    else            state = nextState;    
end
// Asignación de las salidas    
always @ (state) begin
    case (state)
    espera:
    begin
        alarma_o    <=   1'b0;
        bomba_o     <=   1'b0;
    end
    llenado:
    begin
        alarma_o    <=   1'b0;
        bomba_o     <=   1'b1;
    end
    alarma:
    begin
        alarma_o    <=   1'b1;
        bomba_o     <=   1'b0;
    end
   endcase
   end 
        
        
endmodule

//

