// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module top(
    input  wire clk,    // System Clock
    output wire ltc     // LTC Output
);

    // Synchronous Reset Signal Generator
    wire reset_n;
    reset_gen reset_gen(clk, reset_n);

    // Linear Timecode Generator
    ltc #(25000000, 25) ltc_encoder(reset_n, clk, ltc);

endmodule;
