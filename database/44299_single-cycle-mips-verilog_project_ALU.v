// This program was cloned from: https://github.com/conneroisu/single-cycle-mips-verilog
// License: MIT License

`timescale 1ns / 1ps
module ALU (
    input      [31:0] i_data1,        // data 1
    input      [31:0] i_read2,        // data 2 from MUX
    input      [31:0] i_Instruction,  // used for sign-extension
    input             i_ALUSrc,
    input      [ 3:0] i_ALUcontrol,
    output reg        o_Zero,
    output reg [31:0] o_ALUresult
);
  reg [31:0] data2;
  always @(i_ALUSrc, i_read2, i_Instruction) begin
    if (i_ALUSrc == 0) begin
      data2 = i_read2;
    end else begin
      if (i_Instruction[15] == 1'b0) begin
        data2 = {16'b0, i_Instruction[15:0]};
      end else begin
        data2 = {{16{1'b1}}, i_Instruction[15:0]};
      end
    end
  end
  always @(i_data1, data2, i_ALUcontrol) begin
    case (i_ALUcontrol)
      4'b0000:  // AND
      o_ALUresult = i_data1 & data2;
      4'b0001:  // OR
      o_ALUresult = i_data1 | data2;
      4'b0010:  // ADD
      o_ALUresult = i_data1 + data2;
      4'b0110:  // SUB
      o_ALUresult = i_data1 - data2;
      4'b0111:  // SLT
      o_ALUresult = (i_data1 < data2) ? 1 : 0;
      4'b1100:  // NOR
      o_ALUresult = i_data1 | ~data2;
      default: ;
    endcase
    if (o_ALUresult == 0) begin
      o_Zero = 1;
    end else begin
      o_Zero = 0;
    end
  end
endmodule
