// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

module ext(
    input [1:0] EXTOp,
    input [15:0] Imm,
    output reg [31:0] out
);

    always @(*) begin
        case(EXTOp)
            2'b00:      out <= {16'h0000, Imm};
            2'b01:      out <= {{16{Imm[15]}}, Imm};
            2'b10:      out <= {Imm, 16'h0000};
            2'b11:      out <= 32'hxxxx_xxxx;
            default:    out <= 32'hxxxx_xxxx;
        endcase
    end

endmodule // ext