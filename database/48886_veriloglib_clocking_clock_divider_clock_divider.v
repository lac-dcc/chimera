// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module clock_divider
#(parameter COUNTER_WIDTH = 8)
(
	input clk_i, rst_n,
	input [COUNTER_WIDTH-1:0] prescaler,
	output reg clk_o
);

reg [COUNTER_WIDTH-1:0] counter;

always @(posedge clk_i or negedge rst_n)
	begin
		if(!rst_n)
		begin
			clk_o <= 0;
			counter <= 0;
		end
		else
			counter <= counter + 1;
	end

always @(counter)
	begin
		if (counter == prescaler)
		begin
			clk_o = ~clk_o;
			counter = 0;
		end
	end

endmodule
