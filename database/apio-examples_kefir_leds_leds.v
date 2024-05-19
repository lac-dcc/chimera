// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//------------------------------------------------------------------
//-- Hello world example for the Kéfir I board
//-- Turn on all the leds
//------------------------------------------------------------------

module leds(output wire D1,
            output wire D2,
            output wire D3,
            output wire D4);

assign D1 = 1'b1;
assign D2 = 1'b1;
assign D3 = 1'b1;
assign D4 = 1'b1;

endmodule
