// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

module sign_ext2(
    input [11:0]imm,

    output [31:0]ext_imm
);

/* Get extension bits. */
wire [19:0]ext = {20{(imm[11])? 1'b1 : 1'b0}};

/* Sign-extend. */
assign ext_imm = {ext, imm};

endmodule
