// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//------------------------------------------------------------------
//-- Hello world example for the Alhambra-II baord
//-- Turn on the LED 0
//------------------------------------------------------------------
module leds(output wire LED0,
            output wire LED1,
            output wire LED2,
            output wire LED3,
            output wire LED4,
            output wire LED5,
            output wire LED6,
            output wire LED7
           );
 
  //-- LED0 on
  assign LED0 = 1'b1;

  //-- The other LEDs are off
  assign {LED1, LED2, LED3, LED4, LED5, LED6, LED7} = 7'b0;
  
endmodule

