// This program was cloned from: https://github.com/matiasilva/riscv-cpu
// License: GNU General Public License v3.0

/*
[ctrl]
4'b0000 ADD
4'b1000 SUB
4'b0010 SLT
4'b0011 SLTU
4'b0111 AND
4'b0110 OR
4'b0100 XOR
4'b0001 SLL
4'b0101 SRL
4'b1101 SRA
*/

module alu (
    input  [31:0] alu_a_i,
    input  [31:0] alu_b_i,
    input  [ 3:0] aluctrl_ctrl_i,
    output [31:0] alu_out_o
);

  localparam OP_ADD = 4'b0000;
  localparam OP_SUB = 4'b1000;
  localparam OP_SLT = 4'b0010;
  localparam OP_SLTU = 4'b0011;
  localparam OP_AND = 4'b0111;
  localparam OP_OR = 4'b0110;
  localparam OP_XOR = 4'b0100;
  localparam OP_SLL = 4'b0001;
  localparam OP_SRL = 4'b0101;
  localparam OP_SRA = 4'b1101;

  wire [31:0] diff = alu_a_i - alu_b_i;
  wire [ 4:0] shamt = alu_b_i[4:0];

  reg  [31:0] result;

  always @(*) begin
    result = 32'b0;
    case (aluctrl_ctrl_i)
      OP_ADD:  result = alu_a_i + alu_b_i;
      OP_SUB:  result = diff;
      OP_SLT: begin
        if (alu_a_i[31] ^ alu_b_i[31]) begin
          result = alu_a_i[31];
        end else begin
          result = diff[31];
        end
      end
      OP_SLTU: result = alu_a_i < alu_b_i;
      OP_AND:  result = alu_a_i & alu_b_i;
      OP_OR:   result = alu_a_i | alu_b_i;
      OP_XOR:  result = alu_a_i ^ alu_b_i;
      OP_SLL:  result = alu_a_i << shamt;
      OP_SRL:  result = alu_a_i >> shamt;
      OP_SRA:  result = $signed(alu_a_i) >>> shamt;
    endcase
  end

  assign alu_out_o = result;

endmodule
