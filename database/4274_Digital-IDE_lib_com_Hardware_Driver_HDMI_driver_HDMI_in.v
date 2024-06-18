// This program was cloned from: https://github.com/Nitcloud/Digital-IDE
// License: GNU General Public License v3.0

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