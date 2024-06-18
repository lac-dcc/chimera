// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

// *** Author : Erwin Ouyang
// *** Date   : 8 May 2018
`timescale 1ns / 1ps

module nn_dp_tb();
    localparam T = 10;
    
    reg clk;
    reg rst_n;
    reg clr;
    reg signed [15:0] x;
    reg signed [15:0] w0, w1, w2, w3, w4, w5, w6, w7;
    wire signed [15:0] z0, z1, z2, z3, z4, z5, z6, z7;
    
    nn_dp uut
    (
        .clk(clk),
        .rst_n(rst_n),
        .clr(clr),
        .x(x),
        .w0(w0), .w1(w1), .w2(w2), .w3(w3), .w4(w4), .w5(w5), .w6(w6), .w7(w7),
        .z0(z0), .z1(z1), .z2(z2), .z3(z3), .z4(z4), .z5(z5), .z6(z6), .z7(z7)
    );

    always
    begin
        clk = 0;
        #(T/2);
        clk = 1;
        #(T/2);
    end

    initial
    begin
        rst_n = 0;
        clr = 0;
        x = 0;
        w0 = 0;
        w1 = 0;
        w2 = 0;
        w3 = 0;
        w4 = 0;
        w5 = 0;
        w6 = 0;
        w7 = 0;
        #(T*5);
        rst_n = 1;
        #(T*5);
        
        // x0
        x = 512;
        w0 = 512;
        w1 = 410;
        w2 = 205;
        w3 = 410;
        w4 = 0;
        w5 = 717;
        w6 = 819;
        w7 = 410;
        #T;
        
        // x1
        x = 410;
        w0 = 717;
        w1 = 410;
        w2 = 102;
        w3 = 717;
        w4 = 819;
        w5 = 717;
        w6 = 410;
        w7 = 205;
        #T;
             
        // x2
        x = 205;
        w0 = 512;
        w1 = 410;
        w2 = 717;
        w3 = 717;
        w4 = 205;
        w5 = 410;
        w6 = 922;
        w7 = 819;
        #T;
           
        // x3
        x = 410;
        w0 = 1024;
        w1 = 819;
        w2 = 102;
        w3 = 512;
        w4 = 410;
        w5 = 0;
        w6 = 410;
        w7 = 922;
        #T;
                         
        // x4
        x = 0;
        w0 = 205;
        w1 = 614;
        w2 = 512;
        w3 = 307;
        w4 = 717;
        w5 = 307;
        w6 = 819;
        w7 = 307;
        #T;
        
        // x5
        x = 717;
        w0 = 102;
        w1 = 819;
        w2 = 512;
        w3 = 102;
        w4 = 417;
        w5 = 417;
        w6 = 417;
        w7 = 717;
        #T;
          
        x = 0;
        w0 = 0;
        w1 = 0;
        w2 = 0;
        w3 = 0;
        w4 = 0;
        w5 = 0;
        w6 = 0;
        w7 = 0;   
        clr = 1;
        #T;
        clr = 0;
    end

endmodule
