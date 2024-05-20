// This program was cloned from: https://github.com/openXC7/primitive-tests
// License: BSD 3-Clause "New" or "Revised" License

`default_nettype none   //do not allow undeclared wires

module tristate (
    input  wire clk_p,
    input  wire clk_n,
    input  wire button,
    input  wire tristate_button,
    output wire status_led
    );


    assign status_led = tristate_button ? button : 1'bz;

endmodule
