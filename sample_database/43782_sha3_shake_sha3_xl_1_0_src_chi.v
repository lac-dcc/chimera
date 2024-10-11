// This program was cloned from: https://github.com/ErosCamacho/sha3_shake
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2023 17:10:20
// Design Name: 
// Module Name: chi
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


module chi(
    input   [1599:0] S,
    output  [1599:0] S_o
    );
    
    wire [63:0] bc      [0:4][0:4];
    wire [63:0] bc2     [0:24];
    wire [63:0] S_in    [0:24];
    wire [63:0] S_out   [0:24];
    
    genvar i;
    generate 
    for ( i = 0; i < 25; i = i + 1) begin
        assign S_in[i] = S[((i+1)*64-1):i*64];
    end
    endgenerate
    
    generate 
    for ( i = 0; i < 25; i = i + 1) begin
        assign S_o[((i+1)*64-1):i*64] = S_out[i];
    end
    endgenerate
    
    genvar j;
    generate
        for( j = 0; j < 25; j = j + 5) begin
            for (i = 0; i < 5; i = i + 1) begin
                assign bc[j/5][i] = S_in[j+i];
            end
            for (i = 0; i < 5; i = i + 1) begin
                assign bc2[j + i] = (~bc[j/5][(i + 1)%5] & bc[j/5][(i + 2) % 5]); 
                assign S_out[j + i] = S_in[j + i] ^ bc2[j + i];
            end
        end
        
/*        for(j = 0; j < 25; j += 5) {
            for(i = 0; i < 5; i++)
                bc[i] = s[j + i];
            for(i = 0; i < 5; i++)
                s[j + i] ^= (~bc[(i + 1) % 5]) & bc[(i + 2) % 5];
        }*/
    
    endgenerate 
    
endmodule
