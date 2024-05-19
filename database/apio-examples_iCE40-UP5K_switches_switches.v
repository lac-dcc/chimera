// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

// Example of using 3 switches for setting the color of the RGB led
// Board: iCE40-UP5K
module rgb_test (
                 input sw2,
                 input sw1,
                 input sw0,
                 output led_blue,
                 output led_green,
                 output led_red);


assign led_red = sw2;
assign led_green = sw1;
assign led_blue = sw0;

endmodule
