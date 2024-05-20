// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

module M_SEXT_16(input [15:0] a, output [31:0] y);
    assign y = {{16{a[15]}}, a};
endmodule