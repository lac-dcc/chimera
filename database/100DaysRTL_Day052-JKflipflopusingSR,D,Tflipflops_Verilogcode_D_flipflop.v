// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module D_flipflop(
    input clk, reset, d,
    output reg Q
    );
    
    always@(posedge clk)
          begin
            if({reset})
            Q<= 1'b0;
            else 
            Q <= d;
            end

endmodule
