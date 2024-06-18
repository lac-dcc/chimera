// This program was cloned from: https://github.com/conneroisu/single-cycle-mips-verilog
// License: MIT License

module NextProgramCounter (
    input [31:0] i_Old,  // the original program addr.
    input [31:0] i_Instruction,  // the original instruction
    input i_Jump,
    input i_Branch,
    input i_Bne,
    input i_Zero,
    output reg [31:0] o_Next
);
  reg [31:0] sign_ext;
  reg [31:0] old_alter;  // pc+4
  reg [31:0] jump;  // jump addr.
  reg [31:0] jump_update;
  reg zero_alter;
  initial begin
    o_Next = 32'b0;
  end
  always @(i_Old) begin
    old_alter = i_Old + 4;
  end
  always @(i_Zero, i_Bne) begin
    zero_alter = i_Zero;
    if (i_Bne == 1) begin
      zero_alter = !zero_alter;
    end
  end
  always @(i_Instruction) begin
    // Calculate the jump address from the instruction
    jump_update = {4'b0, i_Instruction[25:0], 2'b0};
    // sign-extension
    if (i_Instruction[15] == 1'b0) begin
      sign_ext = {16'b0, i_Instruction[15:0]};
    end else begin
      sign_ext = {{16{1'b1}}, i_Instruction[15:0]};
    end
    sign_ext = {sign_ext[29:0], 2'b0};  // shift left
  end
  always @(posedge i_Jump or posedge old_alter) begin
    // Update the jump register based on Jump signal
    if (i_Jump) begin
      jump = {old_alter[31:28], jump_update[27:0]};
    end else begin
      jump = jump_update;
    end
  end
  always @(old_alter, sign_ext, jump, i_Branch, zero_alter, i_Jump) begin
    // assign next program counter value
    if (i_Branch == 1 && zero_alter == 1) begin
      o_Next = old_alter + sign_ext;
    end else if (i_Jump == 1) begin
      o_Next = jump;
    end else begin
      o_Next = old_alter;
    end
  end
endmodule
