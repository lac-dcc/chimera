// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///
/// Top-Level Verilog Module
///
/// Only include pins the design is actually using.  Make sure that the pin is
/// given the correct direction: input vs. output vs. inout
///
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
module TinyFPGA_B (
  input CLK,    // 16MHz clock
  output LED,   // User/boot LED next to power LED
  output USBPU  // USB pull-up resistor
);
  reg [23:0] counter;
  always @(posedge CLK) counter <= counter + 1;

  // drive USB pull-up resistor to '0' to disable USB
  assign USBPU = 0;

  assign LED = counter[23];

endmodule
