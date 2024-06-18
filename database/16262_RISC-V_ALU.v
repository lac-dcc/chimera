// This program was cloned from: https://github.com/MihVuongNguyen/RISC-V
// License: Apache License 2.0

module ALU (
    input signed [31:0] A, B,
    input [3:0] opcode,
    output reg signed [31:0] out
);

always @(*) begin
    case (opcode)
        4'b0000 : out = A + B; //ADD or ADDI
        4'b0001 : out = A - B; //SUB
        4'b0010 : out = (A < B)? 1 : 0; //SLT or SLTI
        4'b0011 : out = A ^ B; //XOR or XORI
        4'b0100 : out = A | B ; //OR or ORI
        4'b0101 : out = A & B; //AND or ANDI
        4'b0110 : out = A << B[4:0]; //SLL or SLLI
        4'b0111 : out = A >> B[4:0]; //SRL or SRLI 
        4'b1000 : out = A >>> B[4:0]; //SRA or SRAI
        default: out = 0;
    endcase
end
endmodule