// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//-------------------------------------------------------------------
//-- leds_on_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Juan Gonzalez (Obijuan). April-2016
//-- Jesus Arroyo Torrens
//-- GPL license
//-------------------------------------------------------------------
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module wire_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

//-- wures
reg in;
wire out;

//-- Instantiate the unit to test
simplewire UUT (
           .in(in),
           .out(out)
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, wire_tb);

  //-- Set the cable to 0
  in <= 0;

  //-- Set the cable to 1
  #10 in <= 1;

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
