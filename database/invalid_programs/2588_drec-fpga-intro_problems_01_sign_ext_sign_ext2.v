// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module sign_ext2(
    input [11:0]imm,

    output [31:0]ext_imm
);

/*
*   Problem 5:
*   Describe sign extension logic using ternary operator.
*/

assign ext_imm = {ext, imm};

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module sign_ext2(
    input [11:0]imm,

    output [31:0]ext_imm
);

/*
*   Problem 5 (solved):
*   Describe sign extension logic using ternary operator.
*/

   wire ext = imm[11] ? 1'b1 : 1'b0;

   assign ext_imm = {{20{ext}}, imm};

endmodule
