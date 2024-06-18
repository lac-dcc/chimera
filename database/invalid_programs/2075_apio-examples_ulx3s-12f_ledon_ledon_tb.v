// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//-------------------------------------------------------------------
//-- ledon_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Juan Gonzalez (Obijuan)
//-- GPL license
//-------------------------------------------------------------------
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module ledon_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Leds port
wire led0, led1, led2, led3, led4, led5, led6, led7;

//-- Instantiate the unit to test
led_on UUT (
           .led({led7, led6, led5, led4, led3, led2, led1, led0})
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, ledon_tb);

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
