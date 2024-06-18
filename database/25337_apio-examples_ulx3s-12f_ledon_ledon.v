// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//------------------------------------------------------------------
//-- Turn on one LED
//------------------------------------------------------------------
module led_on(
  output [7:0] led   //-- LEDs
);
 
  //-- LED0 on
  assign led[0] = 1'b1;

  //-- The other LEDs are off
  assign led[7:1] = 6'b0;
  
endmodule

