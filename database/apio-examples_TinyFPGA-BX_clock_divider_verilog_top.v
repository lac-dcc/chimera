// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

// look in pins.pcf for all the pin names on the TinyFPGA BX board
module top (
	input CLK,    // 16MHz clock
	output LED,   // User/boot LED next to power LED
	output USBPU
);

wire clock_div4_0;
wire clock_div4_90;

// drive USB pull-up resistor to '0' to disable USB
assign USBPU = 0;

clock_divider cdiv (.clock_in(CLK),
	.clock_div4_0(clock_div4_0),
	.clock_div4_90(clock_div4_90));


// light up the LED according to the pattern
assign LED = clock_div4_0;

endmodule
