// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

/*
*   Introduction to FPGA and Verilog
*
*   Viktor Prutyanov, 2019
*
*   Module which is synthesized as D-flip-flop
*/

module dff(
    input clk,
    input d,

    output reg q
);

always @(posedge clk) begin
    q <= d;
end

endmodule
