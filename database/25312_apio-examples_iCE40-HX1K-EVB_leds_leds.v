// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//------------------------------------------------------------------
//-- Hello world example
//-- Control leds by pushing the buttons
//-- This example has been tested on the following boards:
//--   * iCE40-HX1K-EVB Olimex
//------------------------------------------------------------------

module leds(output wire  [1:0] led,
			input wire [1:0] but
	);

assign led[0]=but[0];
assign led[1]=but[1];

endmodule
