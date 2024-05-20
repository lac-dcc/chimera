// This program was cloned from: https://github.com/ErosCamacho/sha3_shake
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2023 16:28:12
// Design Name: 
// Module Name: rho_pi
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


module rho_pi(
    input   [1599:0] S,
    output  [1599:0] S_o
    );
    
    localparam [(8*24)-1:0] param_keccakf_rotc = {
    8'b0000_0001, // 1 - 0
    8'b0000_0011, // 3
    8'b0000_0110, // 6
    8'b0000_1010, // 10
    8'b0000_1111, // 15
    8'b0001_0101, // 21
    8'b0001_1100, // 28
    8'b0010_0100, // 36
    8'b0010_1101, // 45
    8'b0011_0111, // 55
    8'b0000_0010, // 2
    8'b0000_1110, // 14
    8'b0001_1011, // 27
    8'b0010_1001, // 41
    8'b0011_1000, // 56
    8'b0000_1000, // 8
    8'b0001_1001, // 25
    8'b0010_1011, // 43
    8'b0011_1110, // 62
    8'b0001_0010, // 18
    8'b0010_0111, // 39
    8'b0011_1101, // 61
    8'b0001_0100, // 20
    8'b0010_1100  // 44 - 23
    };
    
    localparam [(8*24)-1:0] param_keccakf_piln = {
    8'b0000_1010, // 10 - 0
    8'b0000_0111, // 7
    8'b0000_1011, // 11
    8'b0001_0001, // 17 
    8'b0001_0010, // 18
    8'b0000_0011, // 3
    8'b0000_0101, // 5
    8'b0001_0000, // 16
    8'b0000_1000, // 8
    8'b0001_0101, // 21
    8'b0001_1000, // 24
    8'b0000_0100, // 4
    8'b0000_1111, // 15
    8'b0001_0111, // 23
    8'b0001_0011, // 19
    8'b0000_1101, // 13
    8'b0000_1100, // 12
    8'b0000_0010, // 2
    8'b0001_0100, // 20
    8'b0000_1110, // 14
    8'b0001_0110, // 22
    8'b0000_1001, // 9
    8'b0000_0110, // 6
    8'b0000_0001  // 1 - 23
    };
    
    wire [63:0] bc      [0:23];
    wire [63:0] t       [0:23];
    wire [63:0] S_in    [0:24];
    wire [63:0] S_out   [0:24];
    
    genvar i;
    generate 
    for ( i = 0; i < 25; i = i + 1) begin
        assign S_in[i] = S[((i+1)*64-1):i*64];
    end
    endgenerate
    
    assign t[0] = S_in[1];
    assign S_out[0] = S_in[0];
    generate 
    for(i = 0; i < 24; i = i + 1) begin
            assign bc[i] = S_in[param_keccakf_piln[((24-i)*8-1):(24-i-1)*8]];
            assign S_out[param_keccakf_piln[((24-i)*8-1):(24-i-1)*8]] = SHA3_ROTL64(t[i], param_keccakf_rotc[((24-i)*8-1):(24-i-1)*8]);
            assign t[i+1] = bc[i];
    end
    endgenerate
    
    generate 
    for ( i = 0; i < 25; i = i + 1) begin
        assign S_o[((i+1)*64-1):i*64] = S_out[i];
    end
    endgenerate
    
    
    function [63:0] SHA3_ROTL64 ( input [63:0] x, input [63:0] y);
    begin
	SHA3_ROTL64 = ((x << y) | ((x) >> (64 - y)));
	end
    endfunction
    
endmodule
