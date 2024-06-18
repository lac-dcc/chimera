// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//------------------------------------------------------------------
//-- Blinking LED
//------------------------------------------------------------------

module Test (
  input CLK,    // 25MHz clock
  output LED1,  //-- LED to Blink
  output LED2, LED3, LED4  //-- The other LEDs
);

  reg [23:0] counter = 0;

  always @(posedge CLK) 
    counter <= counter + 1;

  assign LED1 = counter[23];

  //-- Turn off the other LEDs
  assign {LED2, LED3, LED4} = 3'b0;

endmodule

