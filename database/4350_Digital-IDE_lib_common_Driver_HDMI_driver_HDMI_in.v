// This program was cloned from: https://github.com/Digital-EDA/Digital-IDE
// License: MIT License

module HDMI_in #(
    parameter    INPUT_WIDTH  = 12,
    parameter    OUTPUT_WIDTH = 12
) (
    input                           clk_in,
    input                           rst_n,
    input  [INPUT_WIDTH - 1 : 0]    data_in,
    output [OUTPUT_WIDTH - 1 : 0]   data_out
);

endmodule  //HDMI_in