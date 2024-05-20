// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230809

`default_nettype none
module StrobeGeneratorTicks #(
	parameter	TICKS	= 10
)(
	input wire  Clock,
	input wire  Reset,
	input wire  Enable_i,
	output reg  Strobe_o
);
	
	localparam MAXCOUNT = TICKS - 1;
	localparam WIDTH = $clog2(MAXCOUNT + 1);
	reg [WIDTH-1:0] Counter;
	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			Counter      <= MAXCOUNT;
			Strobe_o     <= 1'b0;
		end else if(Enable_i) begin
			if(!Counter) begin
				Counter  <= MAXCOUNT;
				Strobe_o <= 1'b1;
			end else begin
				Counter  <= Counter - 1'b1;
				Strobe_o <= 1'b0;
			end 
		end else begin
			Counter <= MAXCOUNT;
		end
	end
	
endmodule
`default_nettype wire
