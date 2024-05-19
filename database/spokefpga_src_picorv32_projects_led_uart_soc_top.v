// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

module top(
    input clk,
    output [7:0] led,
    inout [7:0] pmod
);

wire clk;
wire [7:0] int_led;

wire clock_48mhz;
clock_pll c_pll (.CLKI( clk ), .CLKOP( clock_48mhz ));


led_uart_soc soc(
    .clk(clock_48mhz),
    .led(int_led),
    .uart_tx(pmod[0]),
    .uart_rx(pmod[1])
);

assign led = ~int_led;

endmodule
