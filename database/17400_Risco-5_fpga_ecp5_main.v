// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module top (
    input wire clk,
    input wire reset,
    input wire rx,
    output wire tx,
    output wire [7:0]led,
    inout [5:0]gpios
);

wire reset_o;

ResetBootSystem #(
    .CYCLES(20)
) ResetBootSystem(
    .clk(clk),
    .reset_o(reset_o)
);

Risco_5_SOC #(
    .CLOCK_FREQ(25000000),
    .BIT_RATE(115200),
    .MEMORY_SIZE(8192),
    .MEMORY_FILE("../../software/memory/fpga_test_3.hex"),
    .GPIO_WIDHT(6)
) SOC(
    .clk(clk),
    .reset(reset_o),
    .leds(led),
    .rx(rx),
    .tx(tx),
    .gpios(gpios)
);


endmodule
