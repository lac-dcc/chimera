// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
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


module siso(
    input clk, reset, serial_in,
    output serial_out
    );

    wire q1, q0;

    D_flipflop D2(serial_in, clk, reset, q1);
    D_flipflop D1(q1, clk, reset, q0);
    D_flipflop D0(q0, clk, reset, serial_out);
    
endmodule

