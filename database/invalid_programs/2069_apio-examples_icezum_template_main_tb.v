// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//------------------------------------------------------------------
//-- Verilog template
//-- Test-bench entity
//-- Board: icezum
//------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module main_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

//-- Led port
wire l0;

//-- Instantiation of the unit to test
top UUT (
           .LED0(l0)
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, main_tb);

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
