// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef V_RANDOM
`define V_RANDOM

// modelled around a 74HCT593 8 bit counter

`timescale 1ns/1ns
module random (
    input clk,
    input _OE,
    output [7:0] Q
);
    reg [7:0] val = 0;
    //initial begin
    //    $monitor("%d", val);
    //end

    assign Q = _OE ? 8'bz: val;

    always @(posedge clk) begin
        val <= #27 $random;
    end

endmodule

`endif
