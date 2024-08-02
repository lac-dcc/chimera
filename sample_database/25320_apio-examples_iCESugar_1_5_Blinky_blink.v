// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0


module blink_test (
	input CLK,
	output LED_G,
	output LED_R,
	output LED_B
);

//-- Modify this value for changing the blink frequency
localparam N = 24;  //-- N<=21 Fast, N>=23 Slow

reg [N:0] counter;
always @(posedge CLK)
  counter <= counter + 1;

assign LED_G = counter[N];
assign LED_R = counter[N-1];
assign LED_B = counter[N-2];

endmodule
