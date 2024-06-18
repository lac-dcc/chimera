// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

// *** Author : Erwin Ouyang
// *** Date   : 8 May 2018
`timescale 1ns / 1ps

module nn_dp
    (
        input wire                clk,
        input wire                rst_n,
        input wire                clr,
        input wire signed [15:0]  x,
        input wire signed [15:0]  w0, w1, w2, w3, w4, w5, w6, w7,
        output wire signed [15:0] z0, z1, z2, z3, z4, z5, z6, z7    
    );

    wire signed [15:0] w [0:7];
    wire signed [15:0] z [0:7];
    genvar i;

    assign w[0] = w0;
    assign w[1] = w1;
    assign w[2] = w2;
    assign w[3] = w3;
    assign w[4] = w4;
    assign w[5] = w5;
    assign w[6] = w6;
    assign w[7] = w7;

    assign z0 = z[0];
    assign z1 = z[1];
    assign z2 = z[2];
    assign z3 = z[3];
    assign z4 = z[4];
    assign z5 = z[5];
    assign z6 = z[6];
    assign z7 = z[7];

    generate
        for (i=0; i<=7; i=i+1)
            nn_pe nn_pe_07
            (
                .clk(clk),
                .rst_n(rst_n),
                .clr(clr),
                .x(x),
                .w(w[i]),
                .z(z[i])
            );
    endgenerate
        
endmodule
