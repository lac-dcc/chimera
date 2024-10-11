// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//------------------------------------------------------------------
//-- Hello world example for the iCE40-HX8K board
//-- Turn on all the leds
//------------------------------------------------------------------

module leds(output wire D2,
            output wire D3,
            output wire D4,
            output wire D5,
            output wire D6,
            output wire D7,
            output wire D8,
            output wire D9);

assign D2 = 1'b1;
assign D3 = 1'b1;
assign D4 = 1'b1;
assign D5 = 1'b1;
assign D6 = 1'b1;
assign D7 = 1'b1;
assign D8 = 1'b1;
assign D9 = 1'b1;

endmodule
