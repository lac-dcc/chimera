// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module sign_ext(
    input [11:0]imm,

    output [31:0]ext_imm
);

/*
*   Problem 4:
*   Describe sign extension logic.
*/

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module sign_ext(
    input [11:0]imm,

    output [31:0]ext_imm
);

/*
*   Problem 4 (solved):
*   Describe sign extension logic.
*/
   assign ext_imm = {{20{imm[11]}}, imm};

endmodule
