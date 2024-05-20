// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

// *** Author : Erwin Ouyang
// *** Date   : 6 May 2018
`timescale 1ns / 1ps

module nn_pe
    (
        input wire                clk,
        input wire                rst_n,
        input wire                clr,
        input wire signed [15:0]  x,
        input wire signed [15:0]  w,
        output wire signed [15:0] z    
    );

    reg signed [31:0] z_cv;
    wire signed [31:0] z_nv;
    
    assign z_nv = x * w + z_cv;
    assign z = z_cv[25:10];
    
    always @(posedge clk)
    begin
        if (!rst_n || clr)
            z_cv <= 0;
        else
            z_cv <= z_nv;
    end
 
endmodule
