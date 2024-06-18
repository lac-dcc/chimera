// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//------------------------------------------------------------------
//-- Blinking LED7 (Blue)
//------------------------------------------------------------------

module top(
    input clk_25mhz,    //-- 25Mhz clock
    output [7:0] led,   //-- LEDs
    output wifi_gpio0
);

    // Tie GPIO0, keep board from rebooting
    assign wifi_gpio0 = 1'b1;

    //-- Turn off all the LEDs except LED7
    assign led[6:0] = 7'b0;

    //-- 24 bits counter
    reg [23:0] counter = 0;

    always @(posedge clk_25mhz) 
        counter <= counter + 1;

    //-- The most significant bit of the counter
    //-- is diplayed on LED7 (blue)
    assign led[7] = counter[23];

endmodule
