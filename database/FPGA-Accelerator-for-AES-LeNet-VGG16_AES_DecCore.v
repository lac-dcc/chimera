`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2017 04:33:03 AM
// Design Name: 
// Module Name: DecCore
// Project Name: 
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


module DecCore(
    di, ki, Rrg, do, ko
    );
    input  [127:0] di;
      input  [127:0] ki;
      input  [9:0]   Rrg;
      output [127:0] do;
      output [127:0] ko;
    
      wire   [127:0] sb, sr, mx, dx;
      wire   [31:0]  so;
    
      InvMixColumns MX3 (di[127:96], mx[127:96]);
      InvMixColumns MX2 (di[ 95:64], mx[ 95:64]);
      InvMixColumns MX1 (di[ 63:32], mx[ 63:32]);
      InvMixColumns MX0 (di[ 31: 0], mx[ 31: 0]);
    
      assign dx = (Rrg[8] == 1)? di: mx;
      assign sr = {dx[127:120], dx[ 23: 16], dx[ 47: 40], dx[ 71: 64],
                   dx[ 95: 88], dx[119:112], dx[ 15:  8], dx[ 39: 32],
                   dx[ 63: 56], dx[ 87: 80], dx[111:104], dx[  7:  0],
                   dx[ 31: 24], dx[ 55: 48], dx[ 79: 72], dx[103: 96]};
    
      InvSubBytes SB3 (sr[127:96], sb[127:96]);
      InvSubBytes SB2 (sr[ 95:64], sb[ 95:64]);
      InvSubBytes SB1 (sr[ 63:32], sb[ 63:32]);
      InvSubBytes SB0 (sr[ 31: 0], sb[ 31: 0]);
    
      assign do = sb ^ ki;
    
      function [7:0] rcon;
      input [9:0] x;
        casex (x)
          10'bxxxxxxxxx1: rcon = 8'h01;
          10'bxxxxxxxx1x: rcon = 8'h02;
          10'bxxxxxxx1xx: rcon = 8'h04;
          10'bxxxxxx1xxx: rcon = 8'h08;
          10'bxxxxx1xxxx: rcon = 8'h10;
          10'bxxxx1xxxxx: rcon = 8'h20;
          10'bxxx1xxxxxx: rcon = 8'h40;
          10'bxx1xxxxxxx: rcon = 8'h80;
          10'bx1xxxxxxxx: rcon = 8'h1b;
          10'b1xxxxxxxxx: rcon = 8'h36;
        endcase
      endfunction
    
      SubBytes SBK ({ko[23:16], ko[15:8], ko[7:0], ko[31:24]}, so);
      assign ko[127:96] = ki[127:96] ^ {so[31:24] ^ rcon(Rrg), so[23: 0]};
      assign ko[ 95:64] = ki[ 95:64] ^ ki[127:96];
      assign ko[ 63:32] = ki[ 63:32] ^ ki[ 95:64];
      assign ko[ 31: 0] = ki[ 31: 0] ^ ki[ 63:32];
endmodule
