// This program was cloned from: https://github.com/openXC7/primitive-tests
// License: BSD 3-Clause "New" or "Revised" License

`default_nettype none   //do not allow undeclared wires

module iobuf (
    inout  wire button,
    input  wire data_in,
    input  wire tristate_button,
    output wire button_led
    );

assign button = (tristate_button) ? 1'bZ : data_in;
assign button_led = button;    

endmodule
