// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//------------------------------------------------------------------
//-- Blinking LED1 (Blue)
//------------------------------------------------------------------

module Test (
  input CLK,    // 100MHz clock
  output LED1,  // Led to blink
  output LED2, LED3, LED4  //-- Other LEDs: turned off
);

  reg [25:0] counter = 0;

  always @(posedge CLK) 
    counter <= counter + 1;

  assign LED1 = counter[25];

  //-- Turn off the other LEDs
  assign {LED2, LED3, LED4} = 3'b0;

endmodule


