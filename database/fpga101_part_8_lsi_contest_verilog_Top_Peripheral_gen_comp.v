// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date: 2017/11/06 04:30:43
// Design Name:    Neural Network (using backpropagation)
// Module Name: gen_comp
// Project Name:   LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool Versions: 
//
// Description: 
// 		compare the value of a3_1 and a3_2
// Input :
//		a3_1 : 16 bits :
//		a3_2 : 16 bits :
// Output :
//		LED0 : 1 bit
//		LED1 : 1 bit
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module gen_comp(
    input [15:0]    a3_1,
    input [15:0]    a3_2,
    output          LED0,
    output          LED1
    );

    assign LED0 = (a3_1 > a3_2) ? 1'b1 : 1'b0;
    assign LED1 = ~LED0;    
endmodule
