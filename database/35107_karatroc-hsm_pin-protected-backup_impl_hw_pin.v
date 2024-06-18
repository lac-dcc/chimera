// This program was cloned from: https://github.com/katherinezhao02/karatroc-hsm
// License: MIT License

/* verilator lint_off PINMISSING */

module pin #(
    parameter FIRMWARE_FILE = "fw/pin.mem",
    parameter ROM_ADDR_BITS = 12, // 4K ROM
    parameter RAM_ADDR_BITS = 12, // 4K RAM
    parameter FRAM_ADDR_BITS = 12 // 4k FRAM
) (
    input clk,
    input resetn,
    input rx,
    input cts,
    output tx,
    output rts
);

wrapper #(
    .FIRMWARE_FILE (FIRMWARE_FILE),
    .ROM_ADDR_BITS (ROM_ADDR_BITS),
    .RAM_ADDR_BITS (RAM_ADDR_BITS),
    .FRAM_ADDR_BITS (FRAM_ADDR_BITS)
) wrapper (
    .clk (clk),
    .resetn (resetn),
    .uart_tx (tx),
    .uart_rx (rx),
    .uart_cts (cts),
    .uart_rts (rts)
);

endmodule
