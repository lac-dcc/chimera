// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
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


//////////////////////////////////////////////////////////////////////////////////


module freq_div_by4(
    input clk, reset,
    output clk_by4
    );
    wire clk_by2;
    
    D_flipflop D1(clk, reset, ~clk_by4, clk_by2);
    D_flipflop D2(clk, reset, clk_by2, clk_by4);

endmodule
