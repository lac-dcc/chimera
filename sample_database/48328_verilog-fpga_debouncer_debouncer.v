// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 231104

`default_nettype none
module Debouncer(
	input wire Clock,
	input wire Reset,
	input wire NoisySignal_i,
	output reg FilteredSignal_o,
	output wire RisingEdge_o,
	output wire FallingEdge_o
);

	parameter  CLOCK_HZ 	= 10_000_000;
	parameter  PERIOD_US	= 100;
	localparam DELAY		= (CLOCK_HZ / 1_000_000) * PERIOD_US - 1;
	localparam WIDTH		= $clog2(DELAY + 1);

	reg [WIDTH-1:0] Counter = 0;

	// Signal filtering
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			Counter          <= 0;
			FilteredSignal_o <= 0;
		end else if(NoisySignal_i != FilteredSignal_o && Counter < DELAY) begin
			Counter <= Counter + 1'b1; 
		end else if(Counter == DELAY) begin
			Counter          <= 0; 
			FilteredSignal_o <= NoisySignal_i; 
		end else begin
			Counter <= 0;
		end
	end
	
	// Edge detection
	EdgeDetector EdgeDetector_inst(
		.Clock(Clock),
		.Reset(Reset),
		.Signal_i(FilteredSignal_o),
		.RisingEdge_o(RisingEdge_o),
		.FallingEdge_o(FallingEdge_o)
	);

endmodule
`default_nettype wire