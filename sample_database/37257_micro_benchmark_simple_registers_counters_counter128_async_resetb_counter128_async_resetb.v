// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

///////////////////////////////////////////
//  Functionality: Counter with asynchronous reset
//  Author:        Xifan Tang
////////////////////////////////////////

module counter128_async_resetb (
	clk,
	resetb,
	result
);

	input clk;
	input resetb;
	output [127:0] result;

	reg [127:0] result;

    initial begin
      result <= 0;
    end

	always @(posedge clk or negedge resetb)
	begin
		if (~resetb) 
			result = 0;		
		else 
			result = result + 1;
	end
endmodule		
