// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module top (
    input wire clk,
    input wire CPU_RESETN,
    input wire rx,
    output wire tx,
    output wire [7:0]LED,
    inout [7:0]gpio
);

wire reset_o;
wire [7:0] led;
reg clk_o;

assign LED = ~led;

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
    .CLOCK_FREQ(100000000),
    .BIT_RATE(115200),
    .MEMORY_SIZE(2048),
    .MEMORY_FILE("../../software/memory/fpga_test_3.hex"),
    .GPIO_WIDHT(8)
) SOC(
    .clk(clk_o),
    .reset(reset_o),
    .leds(led),
    .rx(rx),
    .tx(tx),
    .gpios(gpio)
);

always @(posedge clk) begin
    clk_o = ~clk_o;
end

endmodule
