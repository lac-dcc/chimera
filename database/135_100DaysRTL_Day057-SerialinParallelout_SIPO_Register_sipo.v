// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module D_flipflop(
    input d, clk, reset,
    output reg Q
    );
    
    always@(posedge clk)
          begin
            if(reset)
            Q<= 1'b0;
            else 
            Q <= d;
            end

endmodule

module sipo(
    input clk, reset, serial_in,
    output [2:0] parallel_out
    );
    
    D_flipflop D2(serial_in, clk, reset, parallel_out[2]);
    D_flipflop D1(parallel_out[2], clk, reset, parallel_out[1]);
    D_flipflop D0(parallel_out[1], clk, reset, parallel_out[0]);
    
endmodule
