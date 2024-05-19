// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//-- Turn on the Green on board LED
//-- Board: iCE40-UP5K
module led_test (
	output LEDG_N,
	output LEDR_N,
	output LED1,
	output LED2,
	output LED3,
	output LED4,
	output LED5,
);

//-- Turn on the green signal (inverse logic)
//-- Turn off the red and blue signals (inverse logic)
//-- On board leds are inverse logic, PMOD LEDs are positive logic.

assign LEDR_N = 1;  //-- RED off
assign LEDG_N = 0;  //-- GREEN ON
assign LED1   = 0;  //-- LED1 off
assign LED2   = 0;  //-- LED1 off
assign LED3   = 0;  //-- LED1 off
assign LED4   = 0;  //-- LED1 off
assign LED5   = 0;  //-- LED1 off

endmodule
