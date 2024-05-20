// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230715

`default_nettype none
module EdgeDetector(
	input  wire Clock,
	input  wire Reset,
	input  wire Signal_i,
	output wire RisingEdge_o,
	output wire FallingEdge_o
);

	reg Previous;

	always @(posedge Clock, negedge Reset) begin
		if(!Reset)
			Previous <= 0;
		else
			Previous <= Signal_i; 
	end

	assign RisingEdge_o  = (Previous == 1'b0) && (Signal_i == 1'b1);
	assign FallingEdge_o = (Previous == 1'b1) && (Signal_i == 1'b0);

endmodule
`default_nettype wire
