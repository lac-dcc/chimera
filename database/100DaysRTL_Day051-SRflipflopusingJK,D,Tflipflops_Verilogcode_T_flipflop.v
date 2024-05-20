// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module T_flipflop(
    input t,clk,reset,
    output reg Q
    );
    always@(posedge clk)
          begin
            if(reset)
               Q <= 1'b0;
            else
                begin
                   if(t)
                    Q<= ~Q;
                   else
                    Q<= Q;                     
                end
          end
endmodule
