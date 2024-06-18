// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    2017/11/06 04:39:36
// Design Name:    Neural Network (using backpropagation)
// Module Name:    gen_input_k
// Project Name:   LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool Versions: 
//
// Description: 
// 			Generate input k for testing on board using slide switch
// Input :
//		clk : 1 bit
//		SW  : 4 bits
// Output :
//		input_k_1 : 16 bits 00_0000.0000_0000_00 unsigned
//		input_k_2 : 16 bits 00_0000.0000_0000_00 unsigned 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module gen_input_k(
    input clk,
    input [3:0] SW,
    output [15:0] input_k_1,
    output [15:0] input_k_2
    );
    
    reg [15:0] input_k_1;
    reg [15:0] input_k_2;
    
    always @(posedge clk)
    begin
        case (SW)
            4'b0000 : input_k_1 <=  16'b0010_0000_0000_0000;     // k1 = 8
            4'b0001 : input_k_1 <=  16'b0010_0000_0000_0000;     // k1 = 8       
            4'b0010 : input_k_1 <=  16'b0001_0100_0000_0000;     // k1 = 5
            4'b0011 : input_k_1 <=  16'b0001_0100_0000_0000;     // k1 = 5
            4'b0100 : input_k_1 <=  16'b0001_1000_0000_0000;     // k1 = 6
            4'b0101 : input_k_1 <=  16'b0001_1100_0000_0000;     // k1 = 7       
            4'b0110 : input_k_1 <=  16'b0010_0000_0000_0000;     // k1 = 8
            4'b0111 : input_k_1 <=  16'b0010_0100_0000_0000;     // k1 = 9
                               default : input_k_1 <= 16'd0;        
        endcase
    end

    always @(posedge clk)
    begin
        case (SW)
            4'b0000 : input_k_2 <=  16'b0010_0000_0000_0000;     // k2 = 8
            4'b0001 : input_k_2 <=  16'b0001_0100_0000_0000;     // k2 = 5       
            4'b0010 : input_k_2 <=  16'b0010_0000_0000_0000;     // k2 = 8
            4'b0011 : input_k_2 <=  16'b0001_0100_0000_0000;     // k2 = 5       
            4'b0100 : input_k_2 <=  16'b0001_1000_0000_0000;     // k2 = 6
            4'b0101 : input_k_2 <=  16'b0001_1100_0000_0000;     // k2 = 7       
            4'b0110 : input_k_2 <=  16'b0010_0000_0000_0000;     // k2 = 8
            4'b0111 : input_k_2 <=  16'b0010_0100_0000_0000;     // k2 = 9
            default : input_k_2 <= 16'd0;        
        endcase
    end

endmodule
