// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

// *** Author : Erwin Ouyang
// *** Date   : 8 May 2018
`timescale 1ns / 1ps

module matrix_pe
    (
        input wire signed [15:0]  x_in,
        input wire signed [15:0]  z_in,
        input wire signed [15:0]  w,
        output wire signed [15:0] x_out,
        output wire signed [15:0] z_out
    );
    
    wire signed [31:0] z_out_i;
    
    assign x_out = x_in;
    assign z_out_i = x_in * w;
    assign z_out = z_in + z_out_i[25:10];
    
endmodule
