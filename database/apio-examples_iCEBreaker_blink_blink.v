// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0


module blink_test (
	input CLK,
	output LEDG_N,
	output LEDR_N,
	output LED1,
	output LED2,
	output LED3,
	output LED4,
	output LED5,
);

//-- Modify this value for changing the blink frequency
localparam N = 24;  //-- N<=21 Fast, N>=23 Slow

reg [N:0] counter;
always @(posedge CLK)
  counter <= counter + 1;

assign LEDG_N = counter[N];
assign LEDR_N = counter[N-1];
assign {LED5, LED4, LED3, LED2, LED1} = counter[N:N-4];

endmodule
