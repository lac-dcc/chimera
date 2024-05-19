// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:40 06/01/2015 
// Design Name: 
// Module Name:    scancode_to_speccy 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module scancode_to_sam (
    input wire scan_received,
    input wire [7:0] scan,
    //------------------------
    input wire [8:0] sam_row,
    output wire [7:0] sam_col,
    output wire user_reset,
    output wire master_reset,
    output wire user_nmi,
    output wire scanlines_tg,
    output wire scandbl_tg,
    output wire joysplitter_tg,
    input wire[4:0] joystick1,
    input wire[4:0] joystick2
    );
    
//     assign user_reset = 1'b1;
//     assign master_reset = 1'b1;
//     assign user_nmi = 1'b1;
//     
    reg[7:0] row[0:8];
    reg kdel = 1'b0;
    reg kf5 = 1'b0;
    reg kf1;
    reg ksclk = 1'b0;
    reg kminus = 1'b0;
    
    assign sam_col[7:0] = 8'hff ^ (
      ((sam_row[0] == 1'b0) ? row[0] : 8'h00) |
      ((sam_row[1] == 1'b0) ? row[1] : 8'h00) |
      ((sam_row[2] == 1'b0) ? row[2] : 8'h00) |
      ((sam_row[3] == 1'b0) ? {row[3][7:5], (row[3][4:0] | joystick2[4:0])} : 8'h00) |
      ((sam_row[4] == 1'b0) ? {row[4][7:5], (row[4][4:0] | joystick1[4:0])} : 8'h00) |
      ((sam_row[5] == 1'b0) ? row[5] : 8'h00) |
      ((sam_row[6] == 1'b0) ? row[6] : 8'h00) |
      ((sam_row[7] == 1'b0) ? row[7] : 8'h00) |
      ((sam_row[8] == 1'b0) ? row[8] : 8'h00));

    assign user_reset = !(kdel && row[8][0] && row[7][1]);
    assign master_reset = !(row[4][7] && row[8][0] && row[7][1]);
    assign user_nmi = !kf5;
    assign scanlines_tg = kminus;
    assign scandbl_tg = ksclk;
    assign joysplitter_tg = kf1;
    
      // kdel
    // ctrl = row[8][0]
    // alt = row[7][1]
    // bs = row[4][7]
      
      
    reg kextended = 1'b0;
    reg kreleased = 1'b0;
    always @(posedge scan_received) begin
      if (scan == 8'hf0) kreleased <= 1'b1;
      else if (scan == 8'he0) kextended <= 1'b1;
      else begin
        case ({kextended, scan})
//           9'h1f0: {kextended, kreleased} <= 2'b11;
//           9'h0f0: {kextended, kreleased} <= 2'b01;
//           9'h0e0: {kextended, kreleased} <= 2'b10;
//           
          //cs   z  x  c  v  f1  f2  f3
          // a   s  d  f  g  f4  f5  f6
          // q   w  e  r  t  f7  f8  f9
          // 1   2  3  4  5  esc tab caps
          // 0   9  8  7  6  -   +   del
          // p   o  i  u  y  =   ~   f0
          // ent l  k  j  h  ;   :   edit
          // src ss m  n  b  ,   .   inv
          // ctl up dn lt rt
          
          //cs   z  x  c  v  f1  f2  f3
          8'h12: row[0][0] <= ! kreleased;
          8'h59: row[0][0] <= ! kreleased;

          8'h1a: row[0][1] <= ! kreleased;
          8'h22: row[0][2] <= ! kreleased;
          8'h21: row[0][3] <= ! kreleased;
          8'h2a: row[0][4] <= ! kreleased;
          8'h69: row[0][5] <= ! kreleased;
          8'h72: row[0][6] <= ! kreleased;
          8'h7a: row[0][7] <= ! kreleased;

          // a   s  d  f  g  f4  f5  f6
          8'h1c: row[1][0] <= ! kreleased;
          8'h1b: row[1][1] <= ! kreleased;
          8'h23: row[1][2] <= ! kreleased;
          8'h2b: row[1][3] <= ! kreleased;
          8'h34: row[1][4] <= ! kreleased;
          8'h6b: row[1][5] <= ! kreleased;
          8'h73: row[1][6] <= ! kreleased;
          8'h74: row[1][7] <= ! kreleased;

          // q   w  e  r  t  f7  f8  f9
          8'h15: row[2][0] <= ! kreleased;
          8'h1d: row[2][1] <= ! kreleased;
          8'h24: row[2][2] <= ! kreleased;
          8'h2d: row[2][3] <= ! kreleased;
          8'h2c: row[2][4] <= ! kreleased;
          8'h6c: row[2][5] <= ! kreleased;
          8'h75: row[2][6] <= ! kreleased;
          8'h7d: row[2][7] <= ! kreleased;

          // 1   2  3  4  5  esc tab caps
          8'h16: row[3][0] <= ! kreleased;
          8'h1e: row[3][1] <= ! kreleased;
          8'h26: row[3][2] <= ! kreleased;
          8'h25: row[3][3] <= ! kreleased;
          8'h2e: row[3][4] <= ! kreleased;
          8'h76: row[3][5] <= ! kreleased;
          8'h0d: row[3][6] <= ! kreleased;
          8'h58: row[3][7] <= ! kreleased;

          // 0   9  8  7  6  -   +   del
          8'h45: row[4][0] <= ! kreleased;
          8'h46: row[4][1] <= ! kreleased;
          8'h3e: row[4][2] <= ! kreleased;
          8'h3d: row[4][3] <= ! kreleased;
          8'h36: row[4][4] <= ! kreleased;
          8'h4e: row[4][5] <= ! kreleased;
          8'h55: row[4][6] <= ! kreleased;
          8'h66: row[4][7] <= ! kreleased;
          
          // p   o  i  u  y  =   ~   f0
          8'h4d: row[5][0] <= ! kreleased;
          8'h44: row[5][1] <= ! kreleased;
          8'h43: row[5][2] <= ! kreleased;
          8'h3c: row[5][3] <= ! kreleased;
          8'h35: row[5][4] <= ! kreleased;
          8'h54: row[5][5] <= ! kreleased;
          8'h5b: row[5][6] <= ! kreleased;
          8'h70: row[5][7] <= ! kreleased;
          
          // ent l  k  j  h  ;   :   edit
          8'h5a: row[6][0] <= ! kreleased;
          8'h4b: row[6][1] <= ! kreleased;
          8'h42: row[6][2] <= ! kreleased;
          8'h3b: row[6][3] <= ! kreleased;
          8'h33: row[6][4] <= ! kreleased;
          8'h4c: row[6][5] <= ! kreleased;
          8'h52: row[6][6] <= ! kreleased;
          9'h111: row[6][7] <= ! kreleased;
          
          // src ss m  n  b  ,   .   inv
          8'h29: row[7][0] <= ! kreleased;
          8'h14: row[7][1] <= ! kreleased;
          9'h114: row[7][1] <= ! kreleased;
          8'h3a: row[7][2] <= ! kreleased;
          8'h31: row[7][3] <= ! kreleased;
          8'h32: row[7][4] <= ! kreleased;
          8'h41: row[7][5] <= ! kreleased;
          8'h49: row[7][6] <= ! kreleased;
          8'h4a: row[7][7] <= ! kreleased;

          // ctl up dn lt rt
          8'h11: row[8][0] <= ! kreleased;
          9'h175: row[8][1] <= ! kreleased;
          9'h172: row[8][2] <= ! kreleased;
          9'h16b: row[8][3] <= ! kreleased;
          9'h174: row[8][4] <= ! kreleased;
          
          // other keys
          9'h171: kdel <= ! kreleased;
          8'h03: kf5 <= ! kreleased;
          8'h7e: ksclk <= ! kreleased;
          8'h7b: kminus <= ! kreleased;
          8'h05: kf1 <= ! kreleased;
          
        endcase
        kextended <= 1'b0;
        kreleased <= 1'b0;
      end
    end
    
endmodule

    
