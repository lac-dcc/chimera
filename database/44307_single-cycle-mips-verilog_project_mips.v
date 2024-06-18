// This program was cloned from: https://github.com/conneroisu/single-cycle-mips-verilog
// License: MIT License

`timescale 1ns / 1ps
module mips (
    input i_Clk,  // clock signal for PC and RD
    input i_Rst,
    output [6:0] o_Seg_first,
    output [6:0] o_Seg_second,
    output [6:0] o_Seg_third,
    output [6:0] o_Seg_fourth,
    output [6:0] o_Seg_fifth
);
  wire [31:0] s_input_program_counter, s_out_program_counter;
  wire [ 5:0] im_ctr;
  wire [ 5:0] im_funcode;
  wire [31:0] im_instruction;
  wire [31:0] r_wbdata, r_read1, r_read2;
  wire s_RegDst, s_Jump, s_Branch, s_Bne;
  wire s_MemRead, s_MemtoReg, s_MemWrite;
  wire s_ALUSrc, s_RegWrite;
  wire [1:0] c_ALUOp;
  wire [3:0] c_ALUcontrol;
  wire c_zero;
  wire [31:0] alu_result;
  ProgramCounter inst_ProgramCounter (
      .i_Clk (i_Clk),
      .i_Next(s_input_program_counter),
      .o_Out (s_out_program_counter)
  );
  InstructionMemory inst_InstructionMemory (
      .i_Addr       (s_out_program_counter),
      .i_Ctr        (im_ctr),
      .i_Funcode    (im_funcode),
      .i_Instruction(im_instruction)
  );
  RegisterFile inst_RegisterFile (
      .i_Clk        (i_Clk),
      .i_Instruction(im_instruction),
      .i_RegWrite   (s_RegWrite),
      .i_RegDst     (s_RegDst),
      .i_WriteData  (r_wbdata),
      .o_ReadData1  (r_read1),
      .o_ReadData2  (r_read2)
  );
  ALU inst_ALU (
      .i_data1      (r_read1),
      .i_read2      (r_read2),
      .i_Instruction(im_instruction),
      .i_ALUSrc     (s_ALUSrc),
      .i_ALUcontrol (c_ALUcontrol),
      .o_Zero       (c_zero),
      .o_ALUresult  (alu_result)
  );
  ALUControl inst_ALUControl (
      .i_ALUOp      (c_ALUOp),
      .i_Instruction(im_funcode),
      .o_ALUcontrol (c_ALUcontrol)
  );
  ControlUnit inst_ControlUnit (
      .i_instruction(im_instruction),
      .o_RegDst     (s_RegDst),
      .o_Jump       (s_Jump),
      .o_Branch     (s_Branch),
      .o_Bne        (s_Bne),
      .o_MemRead    (s_MemRead),
      .o_MemtoReg   (s_MemtoReg),
      .o_ALUOp      (c_ALUOp),
      .o_MemWrite   (s_MemWrite),
      .o_ALUSrc     (s_ALUSrc),
      .o_RegWrite   (s_RegWrite),
      .o_seg_first  (o_Seg_first),
      .o_seg_second (o_Seg_second),
      .o_seg_third  (o_Seg_third),
      .o_seg_fourth (o_Seg_fourth),
      .o_seg_fifth  (o_Seg_fifth)
  );
  DataMemory inst_DataMemory (
      .i_clk      (i_Clk),
      .i_addr     (alu_result),  // im_instruction[15:0]
      .i_wData    (r_read2),
      .i_ALUresult(alu_result),
      .i_MemWrite (s_MemWrite),
      .i_MemRead  (s_MemRead),
      .i_MemtoReg (s_MemtoReg),
      .o_rData    (r_wbdata)
  );
  NextProgramCounter inst_NextProgramCounter (
      .i_Old        (s_out_program_counter),
      .i_Instruction(im_instruction),
      .i_Jump       (s_Jump),
      .i_Branch     (s_Branch),
      .i_Bne        (s_Bne),
      .i_Zero       (c_zero),
      .o_Next       (s_input_program_counter)
  );
endmodule
