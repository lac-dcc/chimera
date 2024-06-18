// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

`timescale 1 ns / 100 ps

module testbench();

/* Input value. */
reg [11:0]imm = 0;

/* First version extension. */
wire [31:0]ext_imm;
sign_ext se(.imm(imm), .ext_imm(ext_imm));

/* Second version extension. */
wire [31:0]ext_imm2;
sign_ext2 se2(.imm(imm), .ext_imm(ext_imm2));

/* Sign inversion. */
wire [31:0]minus_ext_imm;
neg neg(.x(ext_imm), .minus_x(minus_ext_imm));

/* Check first extension. */
wire [31:0]zero;
assign zero = ext_imm + minus_ext_imm;

/* Check second extension. */
wire [31:0]zero2;
assign zero2 = ext_imm2 + minus_ext_imm;

initial begin
    /* Open for dump of signals */
    $dumpvars;
    #2 imm = 5;
    #2 imm = 12;
    #2 imm = -5;
    #2 imm = -12;
    #2 imm = 1337;
    #2 imm = -2019;
    #2 $finish;
end

endmodule
