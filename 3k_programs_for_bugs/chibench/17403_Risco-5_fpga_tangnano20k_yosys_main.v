// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module top (
    input wire clk,
    input wire reset,
    input wire rx,
    output wire tx,
    output wire [5:0] led,
    inout [4:0]gpios
);

wire reset_o;
wire [7:0] leds;

ResetBootSystem #(
    .CYCLES(20)
) ResetBootSystem(
    .clk(clk),
    .reset_o(reset_o)
);

assign led = leds [5:0];

Risco_5_SOC #(
    .CLOCK_FREQ(27000000),
    .BIT_RATE(9600),
    .MEMORY_SIZE(2048),
    .MEMORY_FILE("../../software/memory/fpga_test_3.hex"),
    .GPIO_WIDHT(5)
) SOC(
    .clk(clk),
    .reset(reset_o),
    .leds(leds),
    .rx(rx),
    .tx(tx),
    .gpios(gpios)
);

endmodule
