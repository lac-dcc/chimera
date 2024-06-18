// This program was cloned from: https://github.com/jasonkaufmann/ice40FPGAProjects
// License: MIT License

//-------------------------------------------------------------------
//-- leds_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Juan Gonzalez (Obijuan)
//-- Jesus Arroyo Torrens
//-- GPL license
//-------------------------------------------------------------------
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module leds_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

//-- Leds port
wire d2, d3, d4, d5, d6, d7, d8, d9;

//-- Instantiate the unit to test
leds UUT (
           .D2(d2),
           .D3(d3),
           .D4(d4),
           .D5(d5),
           .D6(d6),
           .D7(d7),
           .D8(d8),
           .D9(d9)
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, leds_tb);

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
