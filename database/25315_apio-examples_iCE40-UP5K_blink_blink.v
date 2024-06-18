// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0


module rgb_test (input clk,
                 output led_blue,
                 output led_green,
                 output led_red);


//-- Modify this value for changing the blink frequency
localparam N = 24;  //-- N<=21 Fast, N>=23 Slow

reg [N:0] counter;
always @(posedge clk)
  counter <= counter + 1;

assign led_green = counter[N];
assign led_blue = counter[N-1];
assign led_red = counter[N-2];

endmodule
