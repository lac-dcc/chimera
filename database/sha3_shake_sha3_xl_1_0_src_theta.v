// This program was cloned from: https://github.com/ErosCamacho/sha3_shake
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2023 15:51:41
// Design Name: 
// Module Name: theta
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


module theta(
    input   [1599:0] S,
    output  [1599:0] S_o
    );
    
    wire [63:0]     bc      [0:4];
    wire [63:0]     t       [0:4];
    wire [63:0]     sum     [0:24];
    wire [63:0]     S_in    [0:24];
    wire [63:0]     S_out   [0:24];
    
    genvar i;
    generate 
    for ( i = 0; i < 25; i = i + 1) begin
        assign S_in[i] = S[((i+1)*64-1):i*64];
    end
    endgenerate
    
    generate
    for (i = 0; i < 5; i = i + 1) begin
        assign  bc[i] =  S_in[i] ^ S_in[i + 5] ^ S_in[i + 10] ^ S_in[i + 15] ^ S_in[i + 20]; 
//        XOR_array XOR_array_1 (.a(S_in[i]),         .b(S_in[i + 5]),  .z(S_xor[i]));
//        XOR_array XOR_array_2 (.a(S_xor[i]),        .b(S_in[i + 10]), .z(S_xor[i + 5])); 
//        XOR_array XOR_array_3 (.a(S_xor[i + 5]),    .b(S_in[i + 15]), .z(S_xor[i + 10]));  
//        XOR_array XOR_array_4 (.a(S_xor[i + 10]),   .b(S_in[i + 20]), .z(bc[i])); 
    end
    endgenerate
    
    genvar j;
    generate
    for (i = 0; i < 5; i = i + 1) begin
        assign  t[i] = bc[(i+4) % 5] ^ SHA3_ROTL64(bc[(i + 1) % 5], 1);  
        //XOR_array XOR_array_5 (.a(bc[(i + 4) % 5]), .b(SHA3_ROTL64(bc[(i + 1) % 5], 1)), .z(t[i])); 
        for(j = 0; j < 25; j = j + 5) begin 
            assign sum[j+i] = S_in[j + i] ^ t[i];
            assign S_out[j + i] = sum[j+i][63:0];
        end
    end
    endgenerate
    
    generate 
    for ( i = 0; i < 25; i = i + 1) begin
        assign S_o[((i+1)*64-1):i*64] = S_out[i];
    end
    endgenerate
    
    
function [0:63] SHA3_ROTL64 ( input [0:63] x, input [0:63] y);
    begin
	SHA3_ROTL64 = (x << y) | ((x) >> (64 - y));
	end
endfunction

endmodule