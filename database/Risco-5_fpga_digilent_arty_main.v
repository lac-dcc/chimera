// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module top (
    input wire clk,
    input wire reset,
    input wire rx,
    output wire tx,
    output wire [3:0]led,
    inout [5:0]gpios
);

wire reset_o;
wire [7:0] leds;
reg clk_o;

assign led = leds[3:0];

initial begin
    clk_o = 1'b0;
end


ResetBootSystem #(
    .CYCLES(20)
) ResetBootSystem(
    .clk(clk_o),
    .reset_o(reset_o)
);

Risco_5_SOC #(
    .CLOCK_FREQ(50000000),
    .BIT_RATE(115200),
    .MEMORY_SIZE(2048),
    .MEMORY_FILE("../../software/memory/fpga_test_3.hex"),
    .GPIO_WIDHT(6)
) SOC(
    .clk(clk_o),
    .reset(reset_o),
    .leds(leds),
    .rx(rx),
    .tx(tx),
    .gpios(gpios)
);

always @(posedge clk) begin
    clk_o = ~clk_o;
end


endmodule
