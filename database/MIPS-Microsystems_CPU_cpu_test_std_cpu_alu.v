// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

`ifdef _DEFINES_V_
`else
    `include "defines.v"
`endif

module alu(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUOp,
    output reg [31:0] C,
    output Overflow
);

    always @(*) begin
        case(ALUOp)
            `ADD_EXE:   C = A + B;
            `ADDU_EXE:  C = A + B;
            `SUB_EXE:   C = A - B;
            `SUBU_EXE:  C = A - B;
            `AND_EXE:   C = A & B;
            `OR_EXE:    C = A | B;
            `XOR_EXE:   C = A ^ B;
            `NOR_EXE:   C = ~(A | B);
            `SLL_EXE:   C = B << A[4:0];
            `SRL_EXE:   C = B >> A[4:0];
            `SRA_EXE:   C = $signed(B) >>> A[4:0];
            `SLT_EXE:   C = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0;
            `SLTU_EXE:  C = (A < B) ? 32'd1 : 32'd0;
            default:    C = 32'hxxxx_xxxx;
        endcase
    end 

    reg [32:0] temp;

    always @(*) begin
        case(ALUOp)
            `ADD_EXE:   temp = {A[31], A} + {B[31], B};
            `SUB_EXE:   temp = {A[31], A} - {B[31], B};
            default:    temp = 32'd0;
        endcase
    end

    assign Overflow = (temp[32] != temp[31]) ? 1'b1 : 1'b0;

endmodule // alu