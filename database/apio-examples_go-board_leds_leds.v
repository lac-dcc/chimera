// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//------------------------------------------------------------------
//-- Hello world example for the nandland go-board
//-- Turn on all the leds
//------------------------------------------------------------------

module leds(output wire LED1,
            output wire LED2,
            output wire LED3,
            output wire LED4);

assign LED1 = 1'b1;
assign LED2 = 1'b1;
assign LED3 = 1'b1;
assign LED4 = 1'b1;

endmodule
