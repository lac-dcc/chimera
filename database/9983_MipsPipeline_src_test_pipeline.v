// This program was cloned from: https://github.com/TCL606/MipsPipeline
// License: MIT License

`timescale 1ns/1ps
module test_pipeline();
	
	reg reset;
	reg sysclk;
	wire [7:0] leds;
	wire [7:0] bcd7;
	wire [3:0] an;
	
	PipelineCPU pipelineCpu(sysclk, reset, leds, bcd7, an);
	
	initial begin
		reset = 1;
		sysclk = 1;
		#10 reset = 0;
	end
	
	always #5 sysclk = ~sysclk;
		
endmodule
