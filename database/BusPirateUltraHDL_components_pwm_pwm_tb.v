// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

// ---------------------------------------------------------------------------
//
// testbed pwm module
//
//	
//
// Written by Chris van Dongen/SMDprutser for the buspirate NextGen Ultra
// SPI info here: https://en.wikipedia.org/wiki/Serial_Peripheral_Interface
//
// ---------------------------------------------------------------------------




`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns


module clockdiv_tb();

// Clock signal
reg clk = 0;
always #0.5 clk = ~clk;

wire clkout;
reg rst;
reg [16:0] onperiod;
reg [16:0] offperiod;

parameter DURATION = 50;


pwm UUT (
	.rst(rst),
	.clkin(clk),
	.clkout(clkout),
	.onperiod(onperiod),
	.offperiod(offperiod)
);

initial begin
  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, clockdiv_tb);

	#0	rst <= 1;
	#1	rst <= 0;
		onperiod <= 16'b0000000000000010;
		offperiod <= 16'b0000000000000001;
	#20	onperiod <= 16'b0000000000000001;
		offperiod <= 16'b0000000000000010;
	#20	onperiod <= 16'b0000000000000111;
		offperiod <= 16'b0000000000000001;



   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule