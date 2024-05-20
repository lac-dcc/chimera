// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module JK_flipflop(
    input j,k,clk,reset,
    output reg Q
    );
    always@(posedge clk)
          begin
            if({reset})
            Q <= 1'b0;
            else
                begin
                case({j,k})
                2'b00:Q<=Q;
                2'b01:Q<=1'b0;
                2'b10:Q<=1'b1;
                2'b11:Q<=~Q;
                endcase
                end          
         end
endmodule
