`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2017 04:31:23 AM
// Design Name: 
// Module Name: EncCore
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


module EncCore(
    di, ki, Rrg, do, ko
    );
    input  [127:0] di;
      input  [127:0] ki;
      input  [9:0]   Rrg;
      output [127:0] do;
      output [127:0] ko;
    
      wire   [127:0] sb, sr, mx;
      wire   [31:0]  so;
    
      SubBytes SB3 (di[127:96], sb[127:96]);
      SubBytes SB2 (di[ 95:64], sb[ 95:64]);
      SubBytes SB1 (di[ 63:32], sb[ 63:32]);
      SubBytes SB0 (di[ 31: 0], sb[ 31: 0]);
    
      assign sr = {sb[127:120], sb[ 87: 80], sb[ 47: 40], sb[  7:  0],
                   sb[ 95: 88], sb[ 55: 48], sb[ 15:  8], sb[103: 96],
                   sb[ 63: 56], sb[ 23: 16], sb[111:104], sb[ 71: 64],
                   sb[ 31: 24], sb[119:112], sb[ 79: 72], sb[ 39: 32]};
    
      MixColumns MX3 (sr[127:96], mx[127:96]);
      MixColumns MX2 (sr[ 95:64], mx[ 95:64]);
      MixColumns MX1 (sr[ 63:32], mx[ 63:32]);
      MixColumns MX0 (sr[ 31: 0], mx[ 31: 0]);
    
      assign do = ((Rrg[0] == 1)? sr: mx) ^ ki;
    
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
    
      SubBytes SBK ({ki[23:16], ki[15:8], ki[7:0], ki[31:24]}, so);
    
      assign ko[127:96] = ki[127:96] ^ {so[31:24] ^ rcon(Rrg), so[23: 0]};
      assign ko[ 95:64] = ki[ 95:64] ^ ko[127:96];
      assign ko[ 63:32] = ki[ 63:32] ^ ko[ 95:64];
      assign ko[ 31: 0] = ki[ 31: 0] ^ ko[ 63:32];
endmodule
