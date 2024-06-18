// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

module counter4_2clock_tb;

	reg clk0, rst0;
	wire [3:0] q0;

	reg clk1, rst1;
	wire [3:0] q1;

	counter4_2clock C_1(
		clk0, 
		rst0,
		clk1, 
		rst1,
		q0, 
		q1
       );
	
	initial begin
		#0 rst0 = 1'b1; clk0 = 1'b0;
		#100 rst0 = 1'b0;
	end

	always begin
		#10 clk0 = ~clk0;
	end

	initial begin
		#0 rst1 = 1'b1; clk1 = 1'b0;
		#100 rst1 = 1'b0;
	end

	always begin
		#20 clk1 = ~clk1;
	end

	
	initial begin
		#5000 $stop;
	end

endmodule
