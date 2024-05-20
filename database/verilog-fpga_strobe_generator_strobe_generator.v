// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230628

`default_nettype none
module StrobeGenerator #(
	parameter	CLOCK_HZ	= 10_000_000,
	parameter	PERIOD_US	= 100
)(
	input wire  Clock,
	input wire  Reset,
	input wire  Enable_i,
	output reg  Strobe_o
);
	
	localparam DELAY = (CLOCK_HZ / 1_000_000) * PERIOD_US - 1;
	localparam WIDTH = $clog2(DELAY + 1);
	
	initial begin
		if(DELAY <= 0)
			$fatal(0, "Wrong DELAY value: %d", DELAY);
	end
	
	reg [WIDTH-1:0] Counter;
	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			Counter      <= DELAY;
			Strobe_o     <= 1'b0;
		end else if(Enable_i) begin
			if(!Counter) begin
				Counter  <= DELAY;
				Strobe_o <= 1'b1;
			end else begin
				Counter  <= Counter - 1'b1;
				Strobe_o <= 1'b0;
			end 
		end else begin
			Counter <= DELAY;
		end
	end
	
endmodule
`default_nettype wire
