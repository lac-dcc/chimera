// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

// ---------------------------------------------------------------------------
//
// testbed frequency counter module
//
//	
//
// Written by Chris van Dongen/SMDprutser for the buspirate NextGen Ultra
//
// ---------------------------------------------------------------------------




`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns


module freqcount_tb();

// Clock signal
reg clkin = 0;
always #0.5 clkin = ~clkin;

// test signal
reg signal =0;
always #1 signal = ~signal;

reg rst;
reg signaledge;
wire [15:0] count;

parameter DURATION = 65536*2;



freqcount UUT (
	.rst(rst),
	.clkin(clkin),
	.signaledge(signaledge),
	.signal(signal),
	.count(count)
);	


initial begin
  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, freqcount_tb);

	#0	rst <= 1;
	#1	rst <= 0;
		signaledge <= 0;


   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule