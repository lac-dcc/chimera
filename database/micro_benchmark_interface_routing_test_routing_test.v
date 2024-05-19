// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License


module routing_test(IN0,IN1,IN2, clk, OUT0,OUT1,OUT2);

input wire IN0,IN1,IN2,clk;

output reg OUT0, OUT1, OUT2;

always @(posedge clk)
	begin

		OUT0  <=  IN0;
		OUT1  <=  IN1;
		OUT2  <=  IN2;

	end



endmodule
