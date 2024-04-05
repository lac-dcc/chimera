`include "defines.v"

`timescale 1ns/1ps

module openmips_min_sopc_tb();

    reg CLOCK_50;
	reg rst;
	
	initial begin
		CLOCK_50 = 1'b0;
		forever #10 CLOCK_50 = ~CLOCK_50;
	end
	
	initial begin
		rst = `ResetEnable;
		#195 rst = `ResetDisable;
		#5000 $stop;
	end

	openmips_min_sopc openmips_min_sopc0(
		.clock(CLOCK_50),
		.reset(rst)
	);
	 
endmodule