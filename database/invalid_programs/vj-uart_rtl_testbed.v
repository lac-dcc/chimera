//=======================================================
//  DE0 Test Module
//=======================================================
`include "system_include.v"

module testbed ();

	reg clk = 0;
	reg areset = 0;
	wire [7:0] LED;
	
	DE0_Comm uut(
		.CLOCK_50(clk),
`ifdef UNDER_TEST
		.areset( areset ),
`endif
		.LED( LED )
	);

	initial begin
		#0 areset = 0;
		#1 areset = 1;
		#2 areset = 0;
	end
	
	always begin
		#10 clk = !clk;
	end

endmodule
