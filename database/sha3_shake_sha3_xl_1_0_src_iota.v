// This program was cloned from: https://github.com/ErosCamacho/sha3_shake
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2023 17:18:58
// Design Name: 
// Module Name: iota
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


module iota(
    input   [1599:0] S,
    output  [1599:0] S_o,
    input   [7:0] round
    );
    
    localparam [(64*24)-1:0] param_keccakf_rndc = {
    64'h0000_0000_0000_0001,
    64'h0000_0000_0000_8082, 
    64'h8000_0000_0000_808a, 
    64'h8000_0000_8000_8000, 
    64'h0000_0000_0000_808b, 
    64'h0000_0000_8000_0001, 
    64'h8000_0000_8000_8081, 
    64'h8000_0000_0000_8009, 
    64'h0000_0000_0000_008a, 
    64'h0000_0000_0000_0088, 
    64'h0000_0000_8000_8009, 
    64'h0000_0000_8000_000a, 
    64'h0000_0000_8000_808b, 
    64'h8000_0000_0000_008b, 
    64'h8000_0000_0000_8089, 
    64'h8000_0000_0000_8003, 
    64'h8000_0000_0000_8002, 
    64'h8000_0000_0000_0080, 
    64'h0000_0000_0000_800a, 
    64'h8000_0000_8000_000a, 
    64'h8000_0000_8000_8081, 
    64'h8000_0000_0000_8080, 
    64'h0000_0000_8000_0001, 
    64'h8000_0000_8000_8008  
    };
    
    wire [63:0] S_in    [0:24];
    wire [63:0] S_out   [0:24];
    reg  [63:0] S_round  ;
    wire [63:0] keccakf_rndc   [0:23];
    
    assign S_out[0] = S_in[0] ^ S_round;
    
    genvar i;
    generate 
    for ( i = 0; i < 25; i = i + 1) begin
        assign S_in[i] = S[((i+1)*64-1):i*64];
    end
    endgenerate
    
    generate 
    for ( i = 0; i < 25; i = i + 1) begin
        if(i != 0) assign S_out[i] = S_in[i];
        assign S_o[((i+1)*64-1):i*64] = S_out[i];
    end
    endgenerate
    
    generate 
    for ( i = 0; i < 24; i = i + 1) begin
        assign keccakf_rndc[i] = param_keccakf_rndc[((24-i)*64-1):(24-i-1)*64];
    end
    endgenerate
    
    always @* begin
    
    case(round)
        0: S_round = keccakf_rndc[0];
        1: S_round = keccakf_rndc[1];
        2: S_round = keccakf_rndc[2];
        3: S_round = keccakf_rndc[3];
        4: S_round = keccakf_rndc[4];
        5: S_round = keccakf_rndc[5];
        6: S_round = keccakf_rndc[6];
        7: S_round = keccakf_rndc[7];
        8: S_round = keccakf_rndc[8];
        9: S_round = keccakf_rndc[9];
        10: S_round = keccakf_rndc[10];
        11: S_round = keccakf_rndc[11];
        12: S_round = keccakf_rndc[12];
        13: S_round = keccakf_rndc[13];
        14: S_round = keccakf_rndc[14];
        15: S_round = keccakf_rndc[15];
        16: S_round = keccakf_rndc[16];
        17: S_round = keccakf_rndc[17];
        18: S_round = keccakf_rndc[18];
        19: S_round = keccakf_rndc[19];
        20: S_round = keccakf_rndc[20];
        21: S_round = keccakf_rndc[21];
        22: S_round = keccakf_rndc[22];
        23: S_round = keccakf_rndc[23];
        default: S_round = keccakf_rndc[0];
    endcase
    
    end
    
    
endmodule
