//////////////////////////////////////////////////////////////////////////////////
// Company: Ridotech
// Engineer: Juan Manuel Rico
// 
// Create Date: 15:43:00 15/10/2017 
// Module Name: fsm_adc
// Description: Rápida máquina de estados para leer el canal 0 y el canal 3 del
//              ADC de la iceZum Alhambra y asignar posiciones de jugadores 1 y 2.
//              http://www.ti.com/lit/ds/symlink/ads7924.pdf
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
//
// Additional Comments: 
//  * Queda por limpiar el código y ver si se puede eliminar la señal de 'busy'
//    en la inicialización usando simplemente la señal de 'ready'.
//  * Generalizar la máquina de estados para leer el resto de canales.
//  * Leer los LSB del canal y asignar a la posición del jugador sin tener que
//    desplazar 'data_rd'. 
//
//////////////////////////////////////////////////////////////////////////////////
module fsm_adc
(
    input  wire       clk,              // System clock.
    input  wire       busy,             // Busy from I2C module.
    input  wire       ready,            // Ready new transfer.
    input  wire       start,            // New sample from ADC. 
    output reg        enable,           // Start transfer.
    input  wire [7:0] data_rd,          // Readed data.
    output reg  [7:0] data_wr,          // Writed data.
    output reg        rw,               // Read/Write (0/1) Signal.
    output reg  [9:0] pos_player1,      // Position player 1.
    output reg  [9:0] pos_player2       // Position player 2.
);

// Estados de la máquina (simplificar en un futuro).
localparam IDLE_INIT = 4'd00;
localparam WR1_INIT  = 4'd01;
localparam WR2_INIT  = 4'd02;
localparam WR3_INIT  = 4'd03;
localparam IDLE_CH0  = 4'd04;
localparam WR1_CH0   = 4'd05;
localparam WR2_CH0   = 4'd06;
localparam RD1_CH0   = 4'd07;
localparam RD2_CH0   = 4'd08;
localparam IDLE_CH3  = 4'd09;
localparam WR1_CH3   = 4'd10;
localparam WR2_CH3   = 4'd11;
localparam RD1_CH3   = 4'd12;
localparam RD2_CH3   = 4'd13;
localparam IDLE_STOP = 4'd14;

//-- fsm states
reg [3:0] state = IDLE_INIT;
reg [3:0] next_state = IDLE_INIT;

//-- Transition between states
always @(posedge clk)
    state <= next_state;
    
//-- Control signal generation and next states
always @(*) begin

  //-- Default values
  next_state = state;      //-- Stay in the same state by default
  enable = 0;
  rw = 0;
  data_wr = 8'h00;
 
 case(state)

    // Esperamos la señal para iniciar la inicialización del ADC.
    IDLE_INIT:
    begin
        if (start)
        begin
           next_state = WR1_INIT;
        end
    end
    
    // Esperamos para comenzar la lectura del canal cero.
    IDLE_CH0:
    begin
        if (start)
        begin
           next_state = WR1_CH0;
        end
    end

    // Esperamos para comenzar la lectura del canal tres.
    IDLE_CH3:
    begin
        if (start)
        begin
           next_state = WR1_CH3;
        end
    end

    // Esperamos hasta que se desactive la señal de 'start' y evitar así relecturas.
    IDLE_STOP:
    begin
        if (~start)
        begin
            next_state = IDLE_CH0;
        end
    end
    
    // Escrituras para inicializar el modo de muestreo.
    //-- Writting 1 state
    //-- The writting phase is started
    //-- Remains in this state until busy is 1 
    WR1_INIT:
    begin
      enable = 1;
      if (busy == 1)
        next_state = WR2_INIT;
    end

    //-- Writting 2 phase: Seleccting the Reg 0x00 by writting 0x00 (default value)
    //-- Wait until busy is 0
    WR2_INIT:
    begin
      enable = 1;
      if (busy == 0)
        next_state = WR3_INIT;
    end

    //-- Writting 3 phase: Set mode control.
    //-- Wait until busy is 1.
    WR3_INIT:
    begin
      enable = 1;
      data_wr = {6'b110011,2'b00}; // Auto-scan mode and start in channel 0.
      if (busy == 1)
        next_state = IDLE_CH0;
    end

    // Escrituras y lecturas encaminadas a obtener el valor del canal 0.
    //-- Writting 1 state
    //-- The writting phase is started
    //-- Remains in this state until ready is 0 
    WR1_CH0:
    begin
      enable = 1;       // Se inicia la transferencia I2C.
      data_wr = 8'h02;  // Se escribe el registro que se desea leer (MSB channel 0).
      if (ready == 0)
        next_state = WR2_CH0;
    end

    //-- Writting 2 phase: Selecting the Reg 0x02 by writting 0x02
    //-- Wait until ready is 1
    WR2_CH0:
    begin
      data_wr = 8'h02;
      if (ready == 1)
        next_state = RD1_CH0;
    end

    //-- Reading 1: Prepare for reading the reg 0x02
    //-- Wait until ready is 0
    RD1_CH0:
    begin
      enable = 1;
      rw = 1;
      data_wr = 8'h02;
      if (ready == 0)
        next_state = RD2_CH0;
    end
    
    //-- Reading 2: Read the 0x02 register
    //-- Wait until ready is 1
    RD2_CH0:
    begin
      rw = 1;
      data_wr = 8'h02; 
      if (ready == 1)
      begin
        pos_player1 <= (data_rd << 1);   // Se lee el dato del bus I2C y
        next_state = IDLE_CH3;           // se asigna a la posición del jugador 1.
      end
    end
    
    // Escrituras y lecturas para leer el valor del canal 3.
    //-- Writting 1 state
    //-- The writting phase is started
    //-- Remains in this state until ready is 0 
    WR1_CH3:
    begin
      enable = 1;          // Se inicia la transferencia.
      data_wr = 8'h06;     // Se escribe el registro que se desea leer (MSB channel 3)
      if (ready == 0)
        next_state = WR2_CH3;
    end

    //-- Writting 2 phase: Selecting the Reg 0x08 by writting 0x08
    //-- Wait until ready is 1
    WR2_CH3:
    begin
      data_wr = 8'h06;
      if (ready == 1)
        next_state = RD1_CH3;
    end

    //-- Reading 1: Prepare for reading the reg 0x08
    //-- Wait until ready is 0
    RD1_CH3:
    begin
      enable = 1;
      rw = 1;
      data_wr = 8'h06;
      if (ready == 0)
        next_state = RD2_CH3;
    end
    
    //-- Reading 2: Read the 0x08 register
    //-- Wait until ready is 1
    RD2_CH3:
    begin
      rw = 1;
      data_wr = 8'h06;
      if (ready == 1)
      begin
        pos_player2 <= (data_rd << 2);   // Se lee el dato del bus I2C y
        next_state = IDLE_STOP;          // se asigna el valor a la posición del jugador 1.
      end
    end
    
    // Por si acaso... :)
    default:
    begin
      enable = 0;
      rw = 0;
    end

  endcase 
end

endmodule