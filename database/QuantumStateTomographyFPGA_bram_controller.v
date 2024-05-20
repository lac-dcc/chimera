// This program was cloned from: https://github.com/nemiller95/QuantumStateTomographyFPGA
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2022 04:43:02 PM
// Design Name: 
// Module Name: bram_controller
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

module bram_controller(
    clk, en, we, addr, din, dout
    );
    input clk, en, we;
    input [6:0] addr; //2*4^n = 2n+1 bits -> 2:0, 4, 6, 8, 10, 12
    input [31:0] din;  // always 32
    output [31:0] dout; // always 32
    // Change width/depth by double clicking blk_mem_gen_0
    // Width = width of each string, depth = # of strings - set to max 4^6 = 4096
    // Addr length for depth - 12 for 4096 (2^12 = 4^6), x2 for neg
    blk_mem_gen_0 bram (
        .clka(clk),    // input wire clka
        .ena(en),      // input wire ena
        .wea(we),      // input wire [0 : 0] wea
        .addra(addr),  // input wire [12 : 0] addra
        .dina(din),    // input wire [31 : 0] dina
        .douta(dout)  // output wire [31 : 0] douta
    );
    
//    always @ (posedge clk)
//    begin
//        ena <= en;
//        wea <= we;
//        clka <= clk;
//        addra <= addr;
//        dina <= din;
//    end
    
//    assign dout = douta;
    
endmodule


//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
//blk_mem_gen_0 your_instance_name (
//  .clka(clka),    // input wire clka
//  .ena(ena),      // input wire ena
//  .wea(wea),      // input wire [0 : 0] wea
//  .addra(addra),  // input wire [3 : 0] addra
//  .dina(dina),    // input wire [15 : 0] dina
//  .douta(douta)  // output wire [15 : 0] douta
//);