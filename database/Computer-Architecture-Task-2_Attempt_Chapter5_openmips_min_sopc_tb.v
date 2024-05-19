// This program was cloned from: https://github.com/lmxyy/Computer-Architecture-Task-2
// License: MIT License

`ifdef openmips_min_sopc_tb.v
`else
 `define openmips_min_sopc_tb.v
// --------------------------------------------------------------------------------
 `timescale 1ns/1ps

 `include "defines.v"
 `include "openmips_min_sopc.v"

module openmips_min_sopc_tb();

   reg CLOCK_50;
   reg     rst;

   integer i;
   
   initial
     begin
	CLOCK_50 = 1'b0;
	forever #10 CLOCK_50 = ~CLOCK_50;
     end

   initial
     begin
	rst = `RstEnable;
	#19 rst = `RstDisable;
	#1000 $finish;
     end

   openmips_min_sopc openmips_min_sopc0(
					.clk(CLOCK_50),
					.rst(rst)
					);
   
endmodule // openmips_min_sopc_tb

// --------------------------------------------------------------------------------
`endif
