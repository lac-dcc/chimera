// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module ImmExtend(imm, ImmExt, imm_ext);
    input [15:0] imm;
    input [1:0] ImmExt;
    output reg [31:0] imm_ext;
    always @(ImmExt, imm)
    begin
        case(ImmExt)
            2'b00: imm_ext = {16'b0,imm};
            2'b01: imm_ext = {{16{imm[15]}},imm};
            2'b10: imm_ext = {imm,16'b0};
            default: imm_ext = {16'b0,imm};
        endcase
    end  
endmodule

