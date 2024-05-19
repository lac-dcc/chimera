// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//------------------------------------------------------------------
//-- Blinking LED
//------------------------------------------------------------------

module Test (
  input CLK,    // 16MHz clock
    output LED,   // User/boot LED next to power LED
    output USBPU  // USB pull-up resistor
);

  // drive USB pull-up resistor to '0' to disable USB
  assign USBPU = 0;

  reg [24:0] counter = 0;

  always @(posedge CLK) 
    counter <= counter + 1;

  assign LED = counter[24];

endmodule


