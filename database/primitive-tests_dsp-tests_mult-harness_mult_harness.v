// This program was cloned from: https://github.com/openXC7/primitive-tests
// License: BSD 3-Clause "New" or "Revised" License

`default_nettype none   //do not allow undeclared wires

module mult_harness (
    input  wire clk,
    output wire uart_tx
    );

    TimesTable times_table (.tx(uart_tx), .clk(clk), .rst(0));

endmodule
