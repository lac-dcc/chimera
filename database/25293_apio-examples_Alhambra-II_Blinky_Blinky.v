// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//------------------------------------------------------------------
//-- Blinking LED
//------------------------------------------------------------------

module Test (
  input CLK,    // 12MHz clock
  output LED7,   // LED to blink
  output LED6, LED5, LED4, LED3, LED2, LED1, LED0 //-- The rest of the LED (turned off)
);

  reg [23:0] counter = 0;

  always @(posedge CLK) 
    counter <= counter + 1;

  assign LED7 = counter[23];

  //-- Turn off the other LEDs
  assign {LED6, LED5, LED4} = 3'b0;
  assign {LED3, LED2, LED1, LED0} = 4'b0;

endmodule


