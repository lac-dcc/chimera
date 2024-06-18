// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "game_config.vh"

module game_random
(
    input             clk,
    input             reset,
    output reg [15:0] random
);

    // Uses LFSR, Linear Feedback Shift Register

    always @(posedge clk or posedge reset)
        if (reset)
            random <= 16'b1111111111111;
        else
            random <=   { random [14:0], 1'b0 }
                      ^ ( random [15] ? 16'b1000000001011 : 16'b0);

endmodule
