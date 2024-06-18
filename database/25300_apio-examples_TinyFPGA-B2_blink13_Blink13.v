// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//-- Hello world example for the TinyFPGA_B2 board
//-- It just blinks the led conected to the pin13
module TinyFPGA_B (
    input pin3_clk_16mhz,
    output pin13);

//-- Modify this value for changing the blink frequency
localparam N = 21;  //-- N<=21 Fast, N>=23 Slow

reg [N:0] counter;
always @(posedge pin3_clk_16mhz)
  counter <= counter + 1;

assign pin13 = counter[N];

endmodule
