// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//-- Turning the RGB LED into Green
//-- Board: iCE40-UP5K
module rgb_test (output led_blue, 
                 output led_green,
                 output led_red);

//-- Turn on the green signal (inverse logic)
//-- Turn off the red and blue signals (inverse logic)

assign led_red = 1;    //-- RED off
assign led_green = 0;  //-- Green ON
assign led_blue = 1;   //-- Blue off

endmodule
