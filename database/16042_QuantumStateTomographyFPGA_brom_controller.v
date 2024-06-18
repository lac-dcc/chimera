// This program was cloned from: https://github.com/nemiller95/QuantumStateTomographyFPGA
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: GT 
// Engineer: Nathan Eli Miller
// 
// Create Date: 11/21/2022 09:31:01 PM
// Design Name: 
// Module Name: brom_controller
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


module brom_controller(
    clk, en, addr, dout
    );
    input clk, en;
    input [5:0] addr; //4^n long = 2n bits -> 1:0, 3:0, 5:0, 7:0, 9:0, 11:0
    output [63:0] dout; // a_width-1 -> 7, 23, 63, 159, 383, 895
    // Change width/depth by double clicking blk_mem_gen_1
    // Width = width of each string, depth = # of strings - set to max 4^6 = 4096
    // Addr length for depth - 12 for 4096 (2^12 = 4^6), x2 for neg
    blk_mem_gen_1 brom (
        .addra(addr),  // input wire [3 : 0] addra
        .clka(clk),    // input wire clka
        .douta(dout),  // output wire [23 : 0] douta
        .ena(en)       // input wire ena
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
