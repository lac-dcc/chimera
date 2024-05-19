// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: AZXUNO
// Engineer: Miguel Angel Rodriguez Jodar
// 
// Create Date:    19:12:34 03/16/2017 
// Design Name:    
// Module Name:    kb_matrix 
// Project Name:   CPC keyboard matrix 
// Target Devices: ZXUNO Spartan 6
// Additional Comments: all rights reserved for now
//
//////////////////////////////////////////////////////////////////////////////////

module kb_matrix (
  input wire clk,
  input wire clkps2,
  input wire dataps2,
  input wire [3:0] rowselect,
  input wire joyup,
  input wire joydown,
  input wire joyleft,
  input wire joyright,
  input wire joyfire1,
  input wire joyfire2,
  output wire [7:0] columns,
  output reg kbd_mreset,
  output reg kbd_reset,
  output reg kbd_nmi,
  output reg kbd_greenscreen,
  output reg kbd_scandoubler
  );

    initial begin
        kbd_reset = 1'b1;
        kbd_nmi = 1'b1;
        kbd_mreset = 1'b1;
        kbd_greenscreen = 1'b0;
    end

    `include "mapa_teclado_es.vh"

    wire new_key_aval;
    wire [7:0] scancode;
    wire is_released;
    wire is_extended;

    reg shift_pressed = 1'b0;
    reg ctrl_pressed = 1'b0;
    reg alt_pressed = 1'b0;

    ps2_port ps2_kbd (
        .clk(clk),  // se recomienda 1 MHz <= clk <= 600 MHz
        .enable_rcv(1'b1),  // habilitar la maquina de estados de recepcion
        .kb_or_mouse(1'b0),
        .ps2clk_ext(clkps2),
        .ps2data_ext(dataps2),
        .kb_interrupt(new_key_aval),  // a 1 durante 1 clk para indicar nueva tecla recibida
        .scancode(scancode), // make o breakcode de la tecla
        .released(is_released),  // soltada=1, pulsada=0
        .extended(is_extended)  // extendida=1, no extendida=0
    );

    reg [7:0] matrix[0:9];  // 73-key matrix keyboard
    initial begin
        matrix[0] = 8'hFF;  // K.    KENT K3    K6  K9 DOWN  RIGHT UP
        matrix[1] = 8'hFF;  // K0    K2   K1    K5  K8 K7    COPY  LEFT
        matrix[2] = 8'hFF;  // CTRL  \    SHIFT 4   ]  ENTER [     CLR 
        matrix[3] = 8'hFF;  // .>    /?   :*    ;+  P  @|    -=    ^£
        matrix[4] = 8'hFF;  // ,<    M    K     L   I  O     9)    0_
        matrix[5] = 8'hFF;  // SPACE N    J     H   Y  U     7'    8(
        matrix[6] = 8'hFF;  // V     B    F     G   R  T     5%    6&
        matrix[7] = 8'hFF;  // X     C    D     S   W  E     3#    4$
        matrix[8] = 8'hFF;  // Z     CPLK A     TAB Q  ESC   2"    1! 
        matrix[9] = 8'hFF;  // DEL
    end

    reg [9:0] rows;
    // Decodificador 4-10 (IC101) para seleccionar la fila del teclado
    always @* begin
      case (rowselect)
        4'd0: rows = 10'b1111111110;
        4'd1: rows = 10'b1111111101;
        4'd2: rows = 10'b1111111011;
        4'd3: rows = 10'b1111110111;
        4'd4: rows = 10'b1111101111;
        4'd5: rows = 10'b1111011111;
        4'd6: rows = 10'b1110111111;
        4'd7: rows = 10'b1101111111;
        4'd8: rows = 10'b1011111111;
        4'd9: rows = 10'b0111111111;
        default: rows = 10'b1111111111;
      endcase
    end

    // Decodificador del joystick
    wire [7:0] joystick_connector = {2'b11, joyfire1, joyfire2, joyright, joyleft, joydown, joyup};
    reg [7:0] joy1column;
    always @* begin
      if (rows[9] == 1'b0)
        joy1column = joystick_connector;
      else
        joy1column = 8'hFF;
    end

    // Reducción AND de todas las columnas de teclado, más el(los) joysticks
    assign columns = (matrix[0] | { {8{rows[0]}} }) &
                     (matrix[1] | { {8{rows[1]}} }) &
                     (matrix[2] | { {8{rows[2]}} }) &
                     (matrix[3] | { {8{rows[3]}} }) &
                     (matrix[4] | { {8{rows[4]}} }) &
                     (matrix[5] | { {8{rows[5]}} }) &
                     (matrix[6] | { {8{rows[6]}} }) &
                     (matrix[7] | { {8{rows[7]}} }) &
                     (matrix[8] | { {8{rows[8]}} }) &
                     (matrix[9] | { {8{rows[9]}} }) &
                     joy1column;

    always @(posedge clk) begin
        if (new_key_aval == 1'b1) begin
            case (scancode)
                //TODO - matrix[1][1] is not mapped to copy
                // Special and control keys
                `KEY_LSHIFT,
                `KEY_RSHIFT:
                    begin
                      if (!is_extended) begin
                        shift_pressed <= ~is_released;
                        matrix[2][5] <= is_released;
                      end
                    end
                `KEY_LCTRL,
                `KEY_RCTRL:
                    begin
                        ctrl_pressed <= ~is_released;
                        matrix[2][7] <= is_released;
                    end
                `KEY_LALT:
                    alt_pressed <= ~is_released;
                `KEY_KPPUNTO: // incluye KEY_SUP, ya que tienen el mismo scancode
                    begin
                      if (ctrl_pressed && alt_pressed) begin
                          kbd_reset <= is_released;
                          if (is_released == 1'b0) begin
                              matrix[0] <= 8'hFF;
                              matrix[1] <= 8'hFF; 
                              matrix[2] <= 8'hFF;
                              matrix[3] <= 8'hFF;
                              matrix[4] <= 8'hFF;
                              matrix[5] <= 8'hFF;
                              matrix[6] <= 8'hFF;
                              matrix[7] <= 8'hFF;
                              matrix[8] <= 8'hFF;
                              matrix[9] <= 8'hFF;
                          end
                      end
                      else if (!is_extended)
                        matrix[0][7] <= is_released;  // KEY_KPPUNTO
                      else
                        matrix[2][0] <= is_released;  // KEY_SUP
                    end
                `KEY_BKSP:
                    begin
                      if (ctrl_pressed && alt_pressed) begin
                          kbd_mreset <= is_released;
                      end                
                      else
                        matrix[9][7] <= is_released;
                    end
                `KEY_F5:
                    if (ctrl_pressed && alt_pressed)
                        kbd_nmi <= is_released;
                `KEY_ENTER:
                    matrix[2][2] <= is_released;
                `KEY_ESC:
                    matrix[8][2] <= is_released;
                `KEY_CPSLK:
                    matrix[8][6] <= is_released;  // CAPS LOCK
                `KEY_TAB:
                    matrix[8][4] <= is_released;
                        
                // Digits and puntuaction marks inside digits
                `KEY_1:
                    matrix[8][0] <= is_released;
                `KEY_2:
                    matrix[8][1] <= is_released;
                `KEY_3:
                    matrix[7][1] <= is_released;
                `KEY_4:
                    matrix[7][0] <= is_released;
                `KEY_5:
                    matrix[6][1] <= is_released;
                `KEY_6:
                    matrix[6][0] <= is_released;
                `KEY_7:
                    matrix[5][1] <= is_released;
                `KEY_8:
                    matrix[5][0] <= is_released;
                `KEY_9:
                    matrix[4][1] <= is_released;
                `KEY_0:
                    matrix[4][0] <= is_released;
                    
                // Alphabetic characters
                `KEY_Z:
                    matrix[8][7] <= is_released;
                `KEY_X:
                    matrix[7][7] <= is_released;
                `KEY_C:
                    matrix[7][6] <= is_released;
                `KEY_V:
                    matrix[6][7] <= is_released;
                `KEY_B:
                    matrix[6][6] <= is_released;
                `KEY_M:
                    matrix[4][6] <= is_released;
                `KEY_N:
                    matrix[5][6] <= is_released;
                `KEY_A:
                    matrix[8][5] <= is_released;
                `KEY_S:
                    matrix[7][4] <= is_released;
                `KEY_D:
                    matrix[7][5] <= is_released;
                `KEY_F:
                    matrix[6][5] <= is_released;
                `KEY_G:
                    matrix[6][4] <= is_released;
                `KEY_Q:
                    matrix[8][3] <= is_released;
                `KEY_W:
                    matrix[7][3] <= is_released;
                `KEY_E:
                    matrix[7][2] <= is_released;
                `KEY_R:
                    matrix[6][2] <= is_released;
                `KEY_T:
                    matrix[6][3] <= is_released;
                `KEY_P:
                    matrix[3][3] <= is_released;
                `KEY_O:
                    matrix[4][2] <= is_released;
                `KEY_I:
                    matrix[4][3] <= is_released;
                `KEY_U:
                    matrix[5][2] <= is_released;
                `KEY_Y:
                    matrix[5][3] <= is_released;
                `KEY_L:
                    matrix[4][4] <= is_released;
                `KEY_K:
                    matrix[4][5] <= is_released;
                `KEY_J:
                    matrix[5][5] <= is_released;
                `KEY_H:
                    matrix[5][4] <= is_released;
                    
                // Symbols
                `KEY_APOS: // es -= en el Amstrad
                    matrix[3][1] <= is_released;
                `KEY_AEXC: // es ^£ en el Amstrad
                    matrix[3][0] <= is_released;
                `KEY_CORCHA: // es @| en el Amstrad
                    matrix[3][2] <= is_released;
                `KEY_CORCHC: // es [{ en el Amstrad
                    matrix[2][1] <= is_released;
                `KEY_NT: // es la Ñ en el teclado español, en el Amstrad es :*
                    matrix[3][5] <= is_released;                
                `KEY_LLAVA: // es ;+ en el Amstrad
                    matrix[3][4] <= is_released;
                `KEY_LLAVC: // es la cedilla en el teclado español, ]} en el Amstrad
                    matrix[2][3] <= is_released;
                `KEY_COMA: // es ,< en el Amstrad
                    matrix[4][7] <= is_released;
                `KEY_PUNTO: // es .> en el Amstrad
                    matrix[3][7] <= is_released;
                `KEY_MENOS: // es /? en el Amstrad
                    matrix[3][6] <= is_released;
                `KEY_LT:// es \' en el Amstrad
                    matrix[2][6] <= is_released;
                `KEY_SPACE:
                    matrix[5][7] <= is_released;
                `KEY_LGUI:
                    if (is_extended) matrix[1][1] <= is_released;
                    
                // Cursor keys
                `KEY_UP:  // también es KEY_KP8
                    if (is_extended) 
                      matrix[0][0] <= is_released;
                    else
                      matrix[1][3] <= is_released;
                `KEY_DOWN: // tambien es KEY_KP2
                    if (is_extended) 
                      matrix[0][2] <= is_released;
                    else
                      matrix[1][6] <= is_released;
                `KEY_LEFT: // también es KEY_KP4
                    if (is_extended) 
                      matrix[1][0] <= is_released;
                    else 
                      matrix[2][4] <= is_released;
                `KEY_RIGHT: // también es KEY_KP6
                    if (is_extended) 
                      matrix[0][1] <= is_released;
                    else
                      matrix[0][4] <= is_released;
                // Bloque numérico (keypad: numeros + ENTER)
                `KEY_KP0:
                    if (!is_extended) matrix[1][7] <= is_released;
                `KEY_KP1:
                    if (!is_extended) matrix[1][5] <= is_released;
                    else if (!is_released) kbd_greenscreen <= ~kbd_greenscreen;
                `KEY_KP3:
                    if (!is_extended) matrix[0][5] <= is_released;
                `KEY_KP5:
                    if (!is_extended) matrix[1][4] <= is_released;
                `KEY_KP7:
                    if (!is_extended) matrix[1][2] <= is_released;
                `KEY_KP9:
                    if (!is_extended) matrix[0][3] <= is_released;
                `KEY_BLKSCR:
                    kbd_scandoubler <= !is_released;
            endcase
        end
    end
endmodule
