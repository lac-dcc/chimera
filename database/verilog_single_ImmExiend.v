// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module ImmExtend(imm, ImmExt, imm_ext);
    input [15:0] imm;
    input ImmExt;
    output [31:0] imm_ext;

    assign imm_ext = ImmExt?{{16{imm[15]}},imm}:{16'b0,imm};

endmodule
