// This program was cloned from: https://github.com/ErosCamacho/sha3_shake
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2023 19:52:21
// Design Name: 
// Module Name: keccak_ctl
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


module keccak_ctl(
    input               clk,
    input               rst,
    input               ini,
    output              fin,
    output  reg [7:0]   round 
    );
    
    reg ope;
    
    always @(posedge clk) begin
        if(!rst) begin
            ope     <= 0;
        end
        else begin
            if      (ini)   ope <= 1;
            else if (fin)   ope <= 0;
            else            ope <= ope;
        end
    end
    
    always @(posedge clk) begin
        if(!rst) begin
            round     <= 0;
        end
        else begin
            if      (ini)           round <= 0;
            else if (ope & !fin)    round <= round + 1;
            else                    round <= round;
        end
    end
    
    //assign round_shift = round >> 2;
    //assign fin = (round_shift == 8'b00010111) ? 1 : 0; //23
    assign fin = (round == 8'b00010111) ? 1 : 0; //23
    //assign fin = 0;
    
endmodule

module keccak_ctl_stages #(
    parameter STAGES = 2
    )(
    input               clk,
    input               rst,
    input               load,
    input               ini,
    output              fin,
    output  reg         ope,
    output  reg [7:0]   round 
    );
    
    //reg ope;
    
    always @(posedge clk) begin
        if(!rst) begin
            ope     <= 0;
        end
        else begin
            if      (fin)   ope <= 0;
            else if (ini)   ope <= 1;
            else            ope <= ope;
        end
    end
    
    always @(posedge clk) begin
        if(!rst) begin
            round     <= 0;
        end
        else begin
            if      (load)          round <= 0;
            else if (ope)           round <= round + STAGES;
            else                    round <= round;
        end
    end
    
    //assign round_shift = round >> 2;
    //assign fin = (round_shift == 8'b00010111) ? 1 : 0; //23
    assign fin = (round >= (8'b00011000 - STAGES)) ? 1 : 0; //23
    //assign fin = 0;
    
endmodule
