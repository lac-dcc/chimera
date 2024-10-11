// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

module counter8_sync_reset_tb;

	reg clk_counter, rst_counter;
	wire [7:0] q_counter;

	counter8_sync_reset C_1(
		clk_counter, 
		q_counter, 
		rst_counter);
	
	initial begin
		#0 rst_counter = 1'b1; clk_counter = 1'b0;
		#100 rst_counter = 1'b0;
	end

	always begin
		#10 clk_counter = ~clk_counter;
	end
	
	initial begin
		#5000 $stop;
	end

endmodule
