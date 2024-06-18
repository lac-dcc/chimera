// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//------------------------------------------------------------------
//-- Blinking LED
//-- The Green LED is blinking. The other LEDs are turned off
//------------------------------------------------------------------
module blink_test (
	input CLK,      //-- 12 Mhz
	output LEDG_N,  //-- Green led to blink
	output LEDR_N,
	output LED1,
	output LED2,
	output LED3,
	output LED4,
	output LED5
);

reg [23:0] counter = 0;

  always @(posedge CLK) 
    counter <= counter + 1;

  //-- Toggle the green LED
  assign LEDG_N = counter[23];

  //-- Turn off the other LEDs
  assign LEDR_N = 3'b1;
  assign {LED5, LED4, LED3, LED2, LED1} = 5'b0;

endmodule
