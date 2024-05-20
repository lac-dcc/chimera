// This program was cloned from: https://github.com/katherinezhao02/karatroc-hsm
// License: MIT License

/* verilator lint_off PINMISSING */

module rng #(
    parameter FIRMWARE_FILE = "fw/rng.mem",
    parameter ROM_ADDR_BITS = 12, // 4K ROM
    parameter RAM_ADDR_BITS = 12, // 4K RAM
    parameter FRAM_ADDR_BITS = 12, // 4k FRAM
    parameter TRNG_WIDTH = 4
) (
    input clk,
    input resetn,
    input rx,
    input cts,
    input [TRNG_WIDTH-1:0] trng_word,
    input trng_valid,
    output trng_req,
    output tx,
    output rts
);

wrapper #(
    .FIRMWARE_FILE (FIRMWARE_FILE),
    .ROM_ADDR_BITS (ROM_ADDR_BITS),
    .RAM_ADDR_BITS (RAM_ADDR_BITS),
    .FRAM_ADDR_BITS (FRAM_ADDR_BITS),
    .TRNG_WIDTH (TRNG_WIDTH)
) wrapper (
    .clk (clk),
    .resetn (resetn),
    .uart_tx (tx),
    .uart_rx (rx),
    .uart_cts (cts),
    .uart_rts (rts),
    .trng_req (trng_req), 
    .trng_word (trng_word),
    .trng_valid (trng_valid)
);

endmodule
