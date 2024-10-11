// This program was cloned from: https://github.com/conneroisu/single-cycle-mips-verilog
// License: MIT License

`timescale 1ns / 1ps
module RegisterFile (
    input i_Clk,
    input [31:0] i_Instruction,  // the raw 32-bit instruction
    input i_RegWrite,
    input i_RegDst,
    input [31:0] i_WriteData,  // from WB stage
    output [31:0] o_ReadData1,
    output [31:0] o_ReadData2
);
  reg [31:0] RegData[31:0];  // register data
  // initialize the regester data
  integer i;
  initial begin
    for (i = 0; i < 32; i = i + 1) begin
      RegData[i] = 32'b0;
    end
  end
  assign o_ReadData1 = RegData[i_Instruction[25:21]];
  assign o_ReadData2 = RegData[i_Instruction[20:16]];
  always @(posedge i_Clk) begin  // RegWrite, RegDst, WriteData, instruction)
    if (i_RegWrite == 1'b1) begin
      // $display("Reg_WriteData: 0x%H",WriteData);
      if (i_RegDst == 1'b0) begin
        RegData[i_Instruction[20:16]] = i_WriteData;
      end else begin
        RegData[i_Instruction[15:11]] = i_WriteData;
      end
    end
  end
endmodule
