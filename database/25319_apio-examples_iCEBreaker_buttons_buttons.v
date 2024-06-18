// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

// Example of using 3 buttons for toggeling the LED
// Board: iCE40-UP5K
module rgb_test (
	input BTN_N,
	input BTN1,
	input BTN2,
	input BTN3,
	output LEDR_N,
	output LEDG_N,
	output LED4,
	output LED1,
	output LED5
);

assign {LEDR_N, LEDG_N} = {BTN_N, ~BTN_N};
assign {LED4, LED1, LED5} = {BTN1, BTN2, BTN3};

endmodule
