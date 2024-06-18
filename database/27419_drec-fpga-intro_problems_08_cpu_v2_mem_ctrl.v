// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module mem_ctrl(
    input clk,
    input [31:0]addr,
    input [31:0]data,
    input we,

    output reg [15:0]data_out = 16'b0
);

always @(posedge clk) begin
/*
*   Problem 4:
*   Drive 'data_out' register here
*/
end

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module mem_ctrl(
    input clk,
    input [31:0]addr,
    input [31:0]data,
    input we,

    output reg [15:0]data_out = 16'b0
);

always @(posedge clk) begin
/*
*   Problem 4:
*   Drive 'data_out' register here
*/
end

endmodule
