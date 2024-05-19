// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0


`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns


module clockdiv_tb();

// Clock signal
reg clk = 0;
always #0.5 clk = ~clk;

wire clkout;
reg rst;
reg [16:0] halfperiod;

parameter DURATION = 50;


clockdiv UUT (
	.rst(rst),
	.clkin(clk),
	.clkout(clkout),
	.halfperiod(halfperiod)
);

initial begin
  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, clockdiv_tb);

	#0	rst <= 1;
	#1	rst <= 0;
		halfperiod <= 16'b0000000000000000;
	#10 halfperiod <= 16'b0000000000000001;
	#10 halfperiod <= 16'b0000000000000010;



   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule