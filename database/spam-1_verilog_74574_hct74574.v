// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef hct74574
`define hct74574

/* Timings from https://assets.nexperia.com/documents/data-sheet/74HC_HCT574.pdf
 * */
`timescale 1ns/1ns
module hct74574 (
input CLK,
input _OE,        // negative enable
input [7:0] D,
output [7:0] Q
);
    parameter LOG=0;
    parameter SETUP_TIME=12;
    parameter PD_CLK_Q=15;
    parameter PD_OE_Q=19;

    reg [7:0] dSetup;
    reg [7:0] dCurrent;

    // setup time 
    assign #(SETUP_TIME) dSetup = D;
    
    specify
        (CLK *> Q) = (PD_CLK_Q);
        (_OE *> Q) = (PD_OE_Q);
    endspecify

    always @(posedge CLK) begin
//        if (LOG) $display("%9t", $time, " REGISTER %m   CLK=+ve _OE=%1b dCurrent=%08b D=%08b Q=%08b", _OE, dCurrent, D, Q);
        dCurrent <= dSetup;
    end

    always @(Q) begin
        if (LOG) $display("%9t", $time, " REGISTER %m   updated Q=%08b   data=%08b", Q, dCurrent);
    end

    assign Q = _OE ? 8'bz: dCurrent;
    
endmodule

`endif
