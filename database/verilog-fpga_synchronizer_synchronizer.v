// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230823

`default_nettype none
module Synchronizer #(
	parameter WIDTH = 1
)(
	input  wire Clock,
	input  wire Reset,
	input  wire [WIDTH-1:0] Async_i,
	output wire [WIDTH-1:0] Sync_o
);

	reg [WIDTH-1:0] R1;
	reg [WIDTH-1:0] R2;

	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			R1 <= 0;
			R2 <= 0;
		end else begin
			R1 <= Async_i;
			R2 <= R1;
		end
	end

	assign Sync_o = R2;

endmodule
`default_nettype wire
