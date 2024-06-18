// This program was cloned from: https://github.com/conneroisu/single-cycle-mips-verilog
// License: MIT License

`timescale 1ns / 1ps
module ALUControl (
    input [1:0] i_ALUOp,
    input [5:0] i_Instruction,
    output reg [3:0] o_ALUcontrol
);
  always @(i_ALUOp, i_Instruction) begin
    case (i_ALUOp)
      2'b00:   o_ALUcontrol = 4'b0010;  // LW / SW | add
      2'b01:   o_ALUcontrol = 4'b0110;  // Branch equal | subtract
      2'b10: begin  // R-Type
        case (i_Instruction)
          6'b100000: begin  // add
            o_ALUcontrol = 4'b0010;
          end
          6'b100010: begin  // sub
            o_ALUcontrol = 4'b0110;
          end
          6'b100100: begin  // and
            o_ALUcontrol = 4'b0000;
          end
          6'b100101: begin  // or
            o_ALUcontrol = 4'b0001;
          end
          6'b101010: begin  // slt
            o_ALUcontrol = 4'b0111;
          end
          default: begin
          end
        endcase
      end
      2'b11:   o_ALUcontrol = 4'b0000;
      default: ;
    endcase
  end
endmodule
