// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//------------------------------------------------------------------
//-- Top-level Verilog example
//------------------------------------------------------------------

module Test (
  input CLK,    // 12MHz clock
  output LED0   // D6
);

  reg [23:0] counter = 0;

  always @(posedge CLK) 
    counter <= counter + 1;

  assign LED0 = counter[23];

endmodule
