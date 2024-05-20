// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:     2017/11/06 01:02:50
// Design Name:     Neural Network (using backpropagation)
// Module Name:     sel_k
// Project Name:    LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool Versions: 
//
// Description: 
//   Select k form input data k or stored data k for updating coefficients. 
// Input:
//		input_k     : 16 bits 00_0000.0000_0000_00 signed : input value of k
//		update_k	: 16 bits 00_0000.0000_0000_00 signed : update value of k
//      update_coeff    : 1 bit : high active
// Output: 
//		k	: 16 bits 00_0000.0000_0000_00 signed : value of k
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module sel_k(
    input signed [15:0] input_k,
    input signed [15:0] update_k,
    input update_coeff,
    output signed [15:0] k
    );
        
    assign k = (update_coeff==1'b1)? update_k: input_k;
    
endmodule
