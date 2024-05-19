// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

`timescale 1 ns / 100 ps

/*
*   Introduction to FPGA and Verilog
*
*   Viktor Prutyanov, 2019
*
*   Testbench for problem set #01
*/

module testbench();

reg [11:0]imm = 0;

wire [31:0]ext_imm;
sign_ext se(.imm(imm), .ext_imm(ext_imm));

/*
*   Problem 1:
*   Define wire 'ext_imm2' with appropriate width.
*/
sign_ext2 se2(.imm(imm), .ext_imm(ext_imm2));

wire [31:0]minus_ext_imm;
neg neg(.x(ext_imm), .minus_x(minus_ext_imm));

wire [31:0]zero;
/*
*   Problem 2:
*   Assign sum of 'ext_imm' and 'minus_ext_imm' to zero.
*/

initial begin
    $dumpvars;      /* Open for dump of signals */
    #2 imm = 5;
    #2 imm = 12;
    #2 imm = -5;
    #2 imm = -12;
    #2 imm = 1337;
    #2 imm = -2019;
    #2 $finish;
end

endmodule
