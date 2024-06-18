// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//------------------------------------------------------------------
//-- Hello world example for the iCEstick board
//-- Turn on all the leds
//------------------------------------------------------------------

module leds(output wire LED0,
            output wire LED1,
            output wire LED2,
            output wire LED3,
            output wire LED4,
            output wire LED5,
            output wire LED6,
            output wire LED7);

assign LED0 = 1'b1;
assign LED1 = 1'b1;
assign LED2 = 1'b1;
assign LED3 = 1'b1;
assign LED4 = 1'b1;
assign LED5 = 1'b1;
assign LED6 = 1'b1;
assign LED7 = 1'b1;

endmodule
