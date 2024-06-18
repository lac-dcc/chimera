// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module clk_reducer(master_clk, slow_clk, reset);

	input master_clk; //50mhz clock
	input reset;
	output reg slow_clk; //25mhz clock
	reg q = 0;

	always@(posedge master_clk)
	begin
		if (reset) begin
			q <= 0;
		end
		q <= ~q; 
		slow_clk <= q;
	end
endmodule



